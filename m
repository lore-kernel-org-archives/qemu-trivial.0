Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXN8U-0002Df-3m
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 04:18:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXN8Q-0002Bi-TL
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:18:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXN8M-0007tu-R3
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:18:22 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:33254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXN8M-0007sZ-CY
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:18:18 -0500
Received: by mail-wr1-f43.google.com with SMTP id c14so1209032wrr.0
	for <qemu-trivial@nongnu.org>; Thu, 13 Dec 2018 01:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uNRCEf3laZRC5i9L/Pvpuyv1Q4We6sQie/MxjkANiOY=;
	b=Ugwk5cczB1qAZagTo6lM3YXMd6uoas/3LNzuaqkLKh2FGj547pfdT0qVkv8N6ItmEv
	ilWJHzme0Gtv7dEBIMFhigspi0iB97D2UE7G6O/AoedydgruAWyLhVzpHcmlEtC3WgWE
	zTfvId4Wg2JzGoSPzsPmYaRWwNuABMSk8I45ejB3zzFRq/AYh+11udjzmTWJvIZWMT6s
	uRIAzHxFh47DVwCmfLTYzj7fHEEfW+FS1kOB7pRcPDjl5q1JA29/uxkManAxBX3kqzF6
	SnxMnlZ3ytncGtJHbeksulHu7moYKKsOur6aWw9QYU8DdD2avGFh9C/Mzh0elRvQxM13
	sXTw==
X-Gm-Message-State: AA+aEWYMphatbMhpQIt/oHm2vxyOjUs2XuBNuCqMqPvhjS0DXeDwBL14
	xk0R/f75zLl7hoSuXXEg7PSHaQ==
X-Google-Smtp-Source: AFSGD/V90GkAy/mu+a4nfqbdkndOLabhxqTUpUIpYd+l+a4lHQ73zYs2a64MxyPRjgiSF69bIjLGIA==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr18957910wrs.318.1544692696395; 
	Thu, 13 Dec 2018 01:18:16 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	t76sm1931981wme.33.2018.12.13.01.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 01:18:15 -0800 (PST)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Liu Yuan <namei.unix@gmail.com>, Max Reitz <mreitz@redhat.com>
References: <20181212194009.2951-1-lvivier@redhat.com>
	<20181212194009.2951-4-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2282b7a4-70fb-bcb1-bc06-3265a2ab6a67@redhat.com>
Date: Thu, 13 Dec 2018 10:18:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181212194009.2951-4-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.43
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] block/file-posix:
 Convert from DPRINTF() macro to trace events
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 09:18:25 -0000

On 12/12/18 8:40 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  block/file-posix.c | 25 ++++++-------------------
>  block/trace-events |  7 +++++++
>  2 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 07bbdab953..cf90899a6e 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -102,19 +102,7 @@
>  #include <xfs/xfs.h>
>  #endif
>  
> -//#define DEBUG_BLOCK
> -
> -#ifdef DEBUG_BLOCK
> -# define DEBUG_BLOCK_PRINT 1
> -#else
> -# define DEBUG_BLOCK_PRINT 0
> -#endif
> -#define DPRINTF(fmt, ...) \
> -do { \
> -    if (DEBUG_BLOCK_PRINT) { \
> -        printf(fmt, ## __VA_ARGS__); \
> -    } \
> -} while (0)
> +#include "trace.h"
>  
>  /* OS X does not have O_DSYNC */
>  #ifndef O_DSYNC
> @@ -1386,7 +1374,7 @@ static int xfs_write_zeroes(BDRVRawState *s, int64_t offset, uint64_t bytes)
>  
>      if (xfsctl(NULL, s->fd, XFS_IOC_ZERO_RANGE, &fl) < 0) {
>          err = errno;
> -        DPRINTF("cannot write zero range (%s)\n", strerror(errno));
> +        trace_file_xfs_write_zeroes(strerror(errno));
>          return -err;
>      }
>  
> @@ -1405,7 +1393,7 @@ static int xfs_discard(BDRVRawState *s, int64_t offset, uint64_t bytes)
>  
>      if (xfsctl(NULL, s->fd, XFS_IOC_UNRESVSP64, &fl) < 0) {
>          err = errno;
> -        DPRINTF("cannot punch hole (%s)\n", strerror(errno));
> +        trace_file_xfs_discard(strerror(errno));
>          return -err;
>      }
>  
> @@ -2798,7 +2786,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>  
>          /* If a match was found, leave the loop */
>          if (*mediaIterator != 0) {
> -            DPRINTF("Matching using %s\n", matching_array[index]);
> +            trace_file_FindEjectableOpticalMedia(matching_array[index]);
>              mediaType = g_strdup(matching_array[index]);
>              break;
>          }
> @@ -2858,7 +2846,7 @@ static bool setup_cdrom(char *bsd_path, Error **errp)
>      if (partition_found == false) {
>          error_setg(errp, "Failed to find a working partition on disc");
>      } else {
> -        DPRINTF("Using %s as optical disc\n", test_partition);
> +        trace_file_setup_cdrom(test_partition);
>          pstrcpy(bsd_path, MAXPATHLEN, test_partition);
>      }
>      return partition_found;
> @@ -2953,8 +2941,7 @@ static bool hdev_is_sg(BlockDriverState *bs)
>  
>      ret = ioctl(s->fd, SG_GET_SCSI_ID, &scsiid);
>      if (ret >= 0) {
> -        DPRINTF("SG device found: type=%d, version=%d\n",
> -            scsiid.scsi_type, sg_version);
> +        trace_file_hdev_is_sg(scsiid.scsi_type, sg_version);
>          return true;
>      }
>  
> diff --git a/block/trace-events b/block/trace-events
> index 5b83280b02..49f31966e7 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -182,3 +182,10 @@ curl_open(const char *file) "opening %s"
>  curl_open_size(uint64_t size) "size = %" PRIu64
>  curl_setup_preadv(uint64_t bytes, uint64_t start, const char *range) "reading %" PRIu64 " at %" PRIu64 " (%s)"
>  curl_close(void) "close"
> +
> +# block/file-posix.c
> +file_xfs_write_zeroes(const char *error) "cannot write zero range (%s)"
> +file_xfs_discard(const char* error) "cannot punch hole (%s)"
> +file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
> +file_setup_cdrom(const char *partition) "Using %s as optical disc"
> +file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
> 

