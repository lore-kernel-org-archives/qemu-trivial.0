Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rTOBL-0008JA-FW
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jan 2024 10:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rTOBD-00089a-J2; Fri, 26 Jan 2024 10:31:43 -0500
Received: from mgamail.intel.com ([198.175.65.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rTOB9-0005mV-MK; Fri, 26 Jan 2024 10:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706283099; x=1737819099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EKMo6U/lvOJFnNwspq9ny6tbalogXbzdbnPbKdSVi/8=;
 b=XSiahVkRkv+OJgFRZfBien7aMrPgohcPY6cy6G+P661cWxbvGXY7a/2x
 +gsH2p6j1DVYICr4a6I1fwQsweDLBpu8rnVS+ySgKq+mz5t/CzuZTCUFD
 MY9/CuVksY5vcbgQ09hZiPSjDgdATBqNlSryxr9NuGwVmozPp55V9hzNF
 UimmhzNAonlQvDwezcqUki1P9xa1KXSuf+zOxGPTk33pibgz6SFveaG5W
 bJI1NIruceWuKUm0Qndi7blT4n6W/No+3XelIRCsHmlt/eHuPnaxH65rH
 EkliHyGoT5hdOQne15BCOtAmWMo6/3cj2ha3tLj9BEsmp9kMpx3r2WFjq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9153934"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9153934"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821174837"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821174837"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orsmga001.jf.intel.com with ESMTP; 26 Jan 2024 07:31:36 -0800
Date: Fri, 26 Jan 2024 23:44:39 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH 06/10] m68k: Clean up includes
Message-ID: <ZbPTZ/pKuCX4Uekk@intel.com>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-7-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125163408.1595135-7-peter.maydell@linaro.org>
Received-SPF: pass client-ip=198.175.65.11; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2024 15:31:44 -0000

On Thu, Jan 25, 2024 at 04:34:04PM +0000, Peter Maydell wrote:
> Date: Thu, 25 Jan 2024 16:34:04 +0000
> From: Peter Maydell <peter.maydell@linaro.org>
> Subject: [PATCH 06/10] m68k: Clean up includes
> X-Mailer: git-send-email 2.34.1
> 
> This commit was created with scripts/clean-includes:
> ./scripts/clean-includes --git m68k include/hw/audio/asc.h include/hw/m68k/*.h
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>   it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>   Drop these, too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/audio/asc.h      | 1 -
>  include/hw/m68k/q800-glue.h | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/include/hw/audio/asc.h b/include/hw/audio/asc.h
> index 4741f92c461..04fac270b6a 100644
> --- a/include/hw/audio/asc.h
> +++ b/include/hw/audio/asc.h
> @@ -13,7 +13,6 @@
>  #ifndef HW_AUDIO_ASC_H
>  #define HW_AUDIO_ASC_H
>  
> -#include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "audio/audio.h"
>  
> diff --git a/include/hw/m68k/q800-glue.h b/include/hw/m68k/q800-glue.h
> index ceb916d16c1..04fac25f6c2 100644
> --- a/include/hw/m68k/q800-glue.h
> +++ b/include/hw/m68k/q800-glue.h
> @@ -23,7 +23,6 @@
>  #ifndef HW_Q800_GLUE_H
>  #define HW_Q800_GLUE_H
>  
> -#include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  
>  #define TYPE_GLUE "q800-glue"
> -- 
> 2.34.1
> 
> 

