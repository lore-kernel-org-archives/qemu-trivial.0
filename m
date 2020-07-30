Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k16pr-00061R-5v
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jul 2020 07:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k16pp-00061H-Tr
 for qemu-trivial@nongnu.org; Thu, 30 Jul 2020 07:34:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30857
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k16pn-0006IX-DA
 for qemu-trivial@nongnu.org; Thu, 30 Jul 2020 07:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596108889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2iao+OtF2uyUjodfO1r2tJ0kY0g0jWcJHNcogVwvLk=;
 b=HOZvdP5SkBI/UYWpy9tzJ4lkHXb87de3Sz3scDb3tmiUIb9ySJHe/1gIbP3TPH0Dy8PEx6
 LVZM0tENfpPuE/JeF45P+pUx9kFv1KN5SKOpcv5bmLw3m42n0U+kOkXNiOoiSqe9xTzWEB
 kJxAZLdo9bFZ8mCDxEM/qooUXo5cb4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-9MvbS-ZeNNGDUaAMgKZ_6Q-1; Thu, 30 Jul 2020 07:34:47 -0400
X-MC-Unique: 9MvbS-ZeNNGDUaAMgKZ_6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA3B718C63C1;
 Thu, 30 Jul 2020 11:34:45 +0000 (UTC)
Received: from localhost (unknown [10.40.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B655A19D7B;
 Thu, 30 Jul 2020 11:34:43 +0000 (UTC)
Date: Thu, 30 Jul 2020 13:34:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-trivial@nongnu.org, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>
Subject: Re: [PATCH-for-5.2] default-configs: Remove ACPI_CPU_HOTPLUG from
 MIPS machines
Message-ID: <20200730133441.39257618@redhat.com>
In-Reply-To: <20200724165259.19939-1-f4bug@amsat.org>
References: <20200724165259.19939-1-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:51:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2020 11:34:54 -0000

On Fri, 24 Jul 2020 18:52:59 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> No MIPS machine uses the ACPI cpu-hotplug feature
> (QEMU implementation is X86 specific).

if I recall correctly we were building it to satisfy symbol dependencies
due to hw/acpi/piix4.c being shared between x86 and mips.

It no longer the case?


> Fixes: 135a67a692 ("ACPI: split CONFIG_ACPI into 4 pieces")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/mips-softmmu-common.mak | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mi=
ps-softmmu-common.mak
> index da29c6c0b2..e9c208da3d 100644
> --- a/default-configs/mips-softmmu-common.mak
> +++ b/default-configs/mips-softmmu-common.mak
> @@ -21,7 +21,6 @@ CONFIG_ACPI=3Dy
>  CONFIG_ACPI_X86=3Dy
>  CONFIG_ACPI_MEMORY_HOTPLUG=3Dy
>  CONFIG_ACPI_NVDIMM=3Dy
> -CONFIG_ACPI_CPU_HOTPLUG=3Dy
>  CONFIG_APM=3Dy
>  CONFIG_I8257=3Dy
>  CONFIG_PIIX4=3Dy


