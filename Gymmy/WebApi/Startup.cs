using ApiDataAccess.General;
using ApiLogic.Implementations.EquipmentLogic;
using ApiLogic.Implementations.Exercise;
using ApiLogic.Implementations.General;
using ApiLogic.Implementations.JWT;
using ApiLogic.Implementations.Marker;
using ApiLogic.Implementations.Profile;
using ApiLogic.Implementations.Routine;
using ApiLogic.Interfaces.EquipmentLogic;
using ApiLogic.Interfaces.Exercise;
using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.JWT;
using ApiLogic.Interfaces.Marker;
using ApiLogic.Interfaces.Profile;
using ApiLogic.Interfaces.Routine;
using ApiUnitOfWork.General;
using JWT.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
           
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            services.AddTransient<IUserLogic,UserLogic>();
            services.AddTransient<ITokenLogic, TokenLogic>();
            services.AddTransient<IEquipmentLogic, EquipmentLogic>();
            services.AddTransient<IExerciseLogic, ExerciseLogic>();
            services.AddTransient<IMarkerLogic, MarkerLogic>();
            services.AddTransient<IRoutineLogic, RoutineLogic>();
            services.AddTransient<IRoutineCategoryLogic, RoutineCategoryLogic>();
            services.AddTransient<IRoutineCategoryLevelLogic, RoutineCategoryLevelLogic>();
            services.AddTransient<IExceptionCustomizedLogic, ExceptionCustomizedLogic>();
            services.AddTransient<IExercisePhotosLogic, ExercisePhotosLogic>();
            services.AddSingleton<IUnitOfWork>(option => new UnitOfWork(
                    Configuration.GetConnectionString("gymmy")
            ));
            var tokenProvider = new JwtProvider("issuer", "audience", "profexorrr_20000");
            services.AddSingleton<ITokenProvider>(tokenProvider);
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options => {
                    options.RequireHttpsMetadata = false;
                    options.TokenValidationParameters = tokenProvider.GetValidationParameters();
                });
            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "WebApi", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "WebApi v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseCors(x => x
             .AllowAnyMethod()
             .AllowAnyHeader()
             .SetIsOriginAllowed(origin => true) // allow any origin
             .AllowCredentials()); // allow credentials

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
