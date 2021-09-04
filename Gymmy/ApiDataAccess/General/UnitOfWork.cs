using ApiDataAccess.EquipmentRepo;
using ApiDataAccess.Exercise;
using ApiDataAccess.Marker;
using ApiDataAccess.Profile;
using ApiDataAccess.Routine;
using ApiRepositories.EquipmentRepo;
using ApiRepositories.Exercise;
using ApiRepositories.Marker;
using ApiRepositories.Profile;
using ApiRepositories.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.General
{
    public class UnitOfWork: IUnitOfWork {
        public IUserRepository IUser { get; }
        public IRoutineRepository IRoutine { get; }
        public IRoutineCategoryRepository IRoutineCategory { get; }
        public IRoutineCategoryLevelRepository IRoutineCategoryLevel { get; }
        public IMarkerRepository IMarker { get; }
        public IEquipmentRepository IEquipment { get; }
        public IExerciseRepository IExercise { get; }
        
        public UnitOfWork(string connectionString)
        {
            IUser = new UserRepository(connectionString);
            IRoutine = new RoutineRepository(connectionString);
            IRoutineCategory = new RoutineCategoryRepository(connectionString);
            IRoutineCategoryLevel = new RoutineCategoryLevelRepository(connectionString);
            IEquipment = new EquipmentRepository(connectionString);
            IExercise = new ExerciseRepository(connectionString);
            IMarker = new MarkerRepository(connectionString);
        }

        
    }
}
