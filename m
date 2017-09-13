Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsEtt-0000nx-DX
	for mharc-qemu-trivial@gnu.org; Wed, 13 Sep 2017 17:08:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dsEtr-0000n5-EW
	for qemu-trivial@nongnu.org; Wed, 13 Sep 2017 17:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dsEtm-0001C8-QL
	for qemu-trivial@nongnu.org; Wed, 13 Sep 2017 17:08:47 -0400
Received: from iserv.reactos.org ([188.40.64.40]:56413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1dsEtm-0001AS-JK; Wed, 13 Sep 2017 17:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=+BGLkAZHpPodc1JxkM6zoGeRJBviYfPNiT4Chiz583s=; 
	b=BggUJZ/EhOBxB3Oq+iE1tYx8KsnFnV4atBv77ufe1dJ0XX7EOZHvuhhaA4wf67gEmO56GG46cHeqo1OE57Zd/0D/2O8wQV3XFFcazIfLNIfMRNIxnLqtMZf+qCk4fUUX1LIy+zfuGEY8xp3oHSlhENLLBfOGGidtMV0ME/uFB7I=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1dsEti-0003TZ-Lb; Wed, 13 Sep 2017 21:08:38 +0000
To: Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	qemu-trivial@nongnu.org
References: <1505293637-10450-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <67cd5928-8afa-ede8-039b-a0204e504df7@reactos.org>
Date: Wed, 13 Sep 2017 23:08:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505293637-10450-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.40.64.40
Subject: Re: [Qemu-trivial] [PATCH] hw/isa/pc87312: Mark the device with
 user_creatable = false
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
X-List-Received-Date: Wed, 13 Sep 2017 21:08:48 -0000

Le 13/09/2017 à 11:07, Thomas Huth a écrit :
> QEMU currently aborts if you try to use the device at the command
> line:
> 
> $ ppc64-softmmu/qemu-system-ppc64 -S -machine prep -device pc87312
> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
> qemu-system-ppc64: -device pc87312: Device 'parallel0' is in use
> Aborted (core dumped)
> 
> It uses parallel_hds in its realize function, so I can not be
> instantiated by the user again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>

However, a better solution would probably to not directly use parallel_hds[0], but to add some Chardev properties to the device, and to fill them in the mainboard code.
This is noted as a "Future incompatible change" in changelog since 2.8

Hervé

> ---
>   hw/isa/pc87312.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
> index 5ce9f0a..48b29e3 100644
> --- a/hw/isa/pc87312.c
> +++ b/hw/isa/pc87312.c
> @@ -386,6 +386,8 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
>       dc->reset = pc87312_reset;
>       dc->vmsd = &vmstate_pc87312;
>       dc->props = pc87312_properties;
> +    /* Reason: Uses parallel_hds[0] in realize(), so it can't be used twice */
> +    dc->user_creatable = false;
>   }
>   
>   static const TypeInfo pc87312_type_info = {
> 


