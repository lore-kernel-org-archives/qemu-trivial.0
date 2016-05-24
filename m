Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5CNu-0008W1-Mv
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 09:28:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5CNs-0008TO-4X
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 09:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5CNl-0000fE-Hy
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 09:28:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b5CNc-0000cZ-7o; Tue, 24 May 2016 09:28:16 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33274821C7;
	Tue, 24 May 2016 13:28:15 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4ODS7gr031391
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 May 2016 09:28:11 -0400
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1464091747-61337-1-git-send-email-imammedo@redhat.com>
Cc: ehabkost@redhat.com, marcel@redhat.com, mst@redhat.com, rth@twiddle.net,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3c3dbb8c-022e-dd69-2f4d-9db84fbcf71c@redhat.com>
Date: Tue, 24 May 2016 15:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1464091747-61337-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 24 May 2016 13:28:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] pc: cleanup unused struct PcRomPciInfo
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
X-List-Received-Date: Tue, 24 May 2016 13:28:33 -0000

Adding qemu-trivial.

Paolo


On 24/05/2016 14:09, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/pc.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 1fd83f4..c48322b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1159,14 +1159,6 @@ void pc_cpus_init(PCMachineState *pcms)
>      smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
>  }
>  
> -/* pci-info ROM file. Little endian format */
> -typedef struct PcRomPciInfo {
> -    uint64_t w32_min;
> -    uint64_t w32_max;
> -    uint64_t w64_min;
> -    uint64_t w64_max;
> -} PcRomPciInfo;
> -
>  static
>  void pc_machine_done(Notifier *notifier, void *data)
>  {
> 

