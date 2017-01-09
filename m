Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQdlW-0004D6-5f
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 12:29:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1cQdlU-0004Bc-0f
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 12:29:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1cQdlQ-0007u5-RA
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 12:29:47 -0500
Received: from david.siemens.de ([192.35.17.14]:45292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
	id 1cQdlQ-0007s7-G7; Mon, 09 Jan 2017 12:29:44 -0500
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v09HTdQ1025467
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Jan 2017 18:29:40 +0100
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v09HTd17025400;
	Mon, 9 Jan 2017 18:29:39 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1483981521-6789-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9ec773dd-c146-6647-7893-1ce8908d7b3f@siemens.com>
Date: Mon, 9 Jan 2017 18:29:39 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1483981521-6789-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 192.35.17.14
Subject: Re: [Qemu-trivial] [PATCH] hw/i386/kvmvapic: Remove dead code in
 patch_hypercalls()
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
X-List-Received-Date: Mon, 09 Jan 2017 17:29:49 -0000

On 2017-01-09 18:05, Peter Maydell wrote:
> The patch_hypercalls() function sets up a 'patches'
> variable and checks it at the end of the function, but
> never modifies it in the middle. Remove this dead code,
> which seems to have been present since the function was
> added in commit e5ad936b0fd7 in 2012.
> 
> (Spotted by Coverity: CID 1005581.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Perhaps this was unintentionally retained debug code?
> It's not clear to me why the ROM should be required to
> have exactly zero or two hypercalls in it. In any case
> we've been fine without checking the patch count for
> five years :-)
> 
> CC'd Jan as original code author just in case he remembers.
> ---
>  hw/i386/kvmvapic.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index b30d1b9..418dba1 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -534,7 +534,6 @@ static int patch_hypercalls(VAPICROMState *s)
>      uint8_t alternates[2];
>      const uint8_t *pattern;
>      const uint8_t *patch;
> -    int patches = 0;
>      off_t pos;
>      uint8_t *rom;
>  
> @@ -565,11 +564,6 @@ static int patch_hypercalls(VAPICROMState *s)
>      }
>  
>      g_free(rom);
> -
> -    if (patches != 0 && patches != 2) {
> -        return -1;
> -    }
> -
>      return 0;
>  }
>  
> 

Hmm, it looked that dead from day #1 on, and I cannot blame it on the
qemu-kvm version as well. Maybe the idea was to count the number of
patches we applied and have this as cross-check. But then I forgot to
count. It's probably safer to bury this code than to try starting to
count to 2 now.

Acked-by: Jan Kiszka <jan.kiszka@siemens.com>

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

