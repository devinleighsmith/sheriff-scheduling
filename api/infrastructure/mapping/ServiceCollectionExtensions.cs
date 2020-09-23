﻿using Mapster;
using MapsterMapper;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Reflection;

namespace SS.Api.Helpers.Mapping
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddMapster(this IServiceCollection services, Action<TypeAdapterConfig> options = null)
        {
            var config = TypeAdapterConfig.GlobalSettings;
            config.Scan(Assembly.GetAssembly(typeof(Startup)) ?? throw new InvalidOperationException());

            options?.Invoke(config);

            services.AddSingleton(config);
            services.AddScoped<IMapper, ServiceMapper>();

            return services;
        }
    }
}