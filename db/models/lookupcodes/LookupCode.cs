﻿using System;
using System.ComponentModel.DataAnnotations;
using db.models;
using Mapster;
using SS.Api.models.db;
using SS.Api.Models.DB;

namespace ss.db.models
{
    [AdaptTo("[name]Dto")]
    public partial class LookupCode : BaseEntity
    {
        [Key]
        public int Id { get; set; }
        public LookupTypes Type { get; set; }
        public string Code { get; set; }
        public string SubCode { get; set; }
        public string Description { get; set; }
        public DateTime? EffectiveDate { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public int? SortOrder { get; set; }
        public int? LocationId { get; set; }
        public virtual Location Location { get; set; }
    }
}
