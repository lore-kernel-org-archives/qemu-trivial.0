Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cD7Nh-0004qk-VL
	for mharc-qemu-trivial@gnu.org; Sat, 03 Dec 2016 05:17:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cD7Nc-0004mO-2w
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2016 05:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cD7NZ-0005Q8-FD
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2016 05:17:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35546)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cD7NU-0005Kh-DN; Sat, 03 Dec 2016 05:17:08 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22FC18E24B;
	Sat,  3 Dec 2016 10:17:07 +0000 (UTC)
Received: from [10.36.116.25] (ovpn-116-25.ams2.redhat.com [10.36.116.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB3AH39K006656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 3 Dec 2016 05:17:05 -0500
To: Yongbok Kim <yongbok.kim@imgtec.com>, qemu-devel@nongnu.org
References: <1480524257-28225-1-git-send-email-yongbok.kim@imgtec.com>
Cc: proljc@gmail.com, aurelien@aurel32.net, qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e874bc96-b1a4-9620-a9c7-b6e82847c475@redhat.com>
Date: Sat, 3 Dec 2016 11:17:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480524257-28225-1-git-send-email-yongbok.kim@imgtec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 03 Dec 2016 10:17:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: fix bad shifts
 in {dextp|dextpdp}
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
X-List-Received-Date: Sat, 03 Dec 2016 10:17:20 -0000

On 30.11.2016 17:44, Yongbok Kim wrote:
> Fixed issues in the MIPSDSP64 instructions dextp and dextpdp.
> Shifting can go out of 32 bit range.
> 
> https://bugs.launchpad.net/qemu/+bug/1631625
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Reported-by: Jia Liu <proljc@gmail.com>
> Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
> ---
>  target-mips/dsp_helper.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
> index df7d220..dc70793 100644
> --- a/target-mips/dsp_helper.c
> +++ b/target-mips/dsp_helper.c
> @@ -3477,7 +3477,7 @@ target_ulong helper_dextp(target_ulong ac, target_ulong size, CPUMIPSState *env)
>  
>      if (sub >= -1) {
>          temp = (tempB << (64 - len)) | (tempA >> len);
> -        temp = temp & ((0x01 << (size + 1)) - 1);
> +        temp = temp & ((1ULL << (size + 1)) - 1);
>          set_DSPControl_efi(0, env);
>      } else {
>          set_DSPControl_efi(1, env);
> @@ -3506,7 +3506,7 @@ target_ulong helper_dextpdp(target_ulong ac, target_ulong size,
>  
>      if (sub >= -1) {
>          temp = (tempB << (64 - len)) | (tempA >> len);
> -        temp = temp & ((0x01 << (size + 1)) - 1);
> +        temp = temp & ((1ULL << (size + 1)) - 1);
>          set_DSPControl_pos(sub, env);
>          set_DSPControl_efi(0, env);
>      } else {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


