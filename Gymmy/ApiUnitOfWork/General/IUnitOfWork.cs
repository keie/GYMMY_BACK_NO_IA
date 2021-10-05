

namespace ApiUnitOfWork.General
{
    using ApiRepositories.EquipmentRepo;
    using ApiRepositories.Exercise;
    using ApiRepositories.Marker;
    using ApiRepositories.Profile;
    using ApiRepositories.Routine;
    using System;
    using System.Collections.Generic;
    using System.Text;
    public interface IUnitOfWork
    {
        IUserRepository IUser { get; }
        IRoutineRepository IRoutine { get; }
        IRoutineCategoryLevelRepository IRoutineCategoryLevel { get; }
        IRoutineCategoryRepository IRoutineCategory { get; }
        IMarkerRepository IMarker { get; }
        IEquipmentRepository IEquipment { get; }
        IExerciseRepository IExercise { get; }
        IExercisePhotoRepository IExercisePhotos { get; }

    }
}
