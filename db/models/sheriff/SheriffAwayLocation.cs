﻿using System;
using System.ComponentModel.DataAnnotations;
using db.models;
using Mapster;
using SS.Api.Models.DB;

namespace SS.Db.models.sheriff
{
    [AdaptTo("[name]Dto")]
    public class SheriffAwayLocation : BaseEntity
    {
        [Key]
        public int Id { get; set; }
        public Location Location { get; set; }
        public int? LocationId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool IsFullDay { get; set; }
        public Guid? SheriffId { get; set; }
        public Sheriff Sheriff { get; set; }
    }
}
