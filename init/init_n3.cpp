/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

static void process_cmdline(char *name, int for_emulator)
{
    char *value = strchr(name, '=');
    int name_len = strlen(name);

    if (value == 0) return;
    *value++ = 0;
    if (name_len == 0) return;

    // self-init!

    if (!strcmp(name,"oppo.rf_version")) {
        if (!strcmp(value, "90")) {
            property_set("ro.rf_version", "TDD_FDD_Ch");
            property_set("ro.product.model", "N5207");
            property_set("ro.build.product", "N5207");
        } else if (!strcmp(value, "91")) {
            property_set("ro.rf_version", "FDD_TDD_Ch");
            property_set("ro.product.model", "N5207");
            property_set("ro.build.product", "N5207");
        } else if (!strcmp(value, "95")) {
            property_set("ro.rf_version", "W_G_L_Eu");
            property_set("ro.product.model", "N5206");
            property_set("ro.build.product", "N5206");
        } else if (!strcmp(value, "96")) {
            property_set("ro.rf_version", "W_G_L_Am");
            property_set("ro.product.model", "N5206");
            property_set("ro.build.product", "N5206");
        } else if (!strcmp(value, "97")) {
            property_set("ro.rf_version", "W_G_L_Tw");
            property_set("ro.product.model", "N5206");
            property_set("ro.build.product", "N5206");
        }
        property_set("ro.oppo.rf_version", value);
    } else if (!strcmp(name,"oppo.pcb_version")) {
        property_set("ro.oppo.pcb_version", value);
    }
    property_set("ro.oppo.device", "n3");
}

extern "C" {
void vendor_load_properties()
{
    import_kernel_cmdline(0,process_cmdline);
}
}
