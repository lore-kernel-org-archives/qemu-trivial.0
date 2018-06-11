Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSCQ4-0006kV-Ht
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 22:18:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fSCQ1-0006hf-I6
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 22:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fSCQ0-0004NO-PA
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 22:18:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36492 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fSCPu-0004Lf-R7; Sun, 10 Jun 2018 22:18:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2BDD406E8A1;
	Mon, 11 Jun 2018 02:18:45 +0000 (UTC)
Received: from redhat.com (ovpn-120-77.rdu2.redhat.com [10.10.120.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F88D10F1C09;
	Mon, 11 Jun 2018 02:18:43 +0000 (UTC)
Date: Mon, 11 Jun 2018 05:18:43 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180611051748-mutt-send-email-mst@kernel.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-34-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180611011501.10235-34-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 11 Jun 2018 02:18:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 11 Jun 2018 02:18:46 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 33/40] hw/i386: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 02:18:54 -0000

On Sun, Jun 10, 2018 at 10:14:54PM -0300, Philippe Mathieu-Daud=E9 wrote:
> @@ -1392,11 +1393,11 @@ void pc_memory_init(PCMachineState *pcms,
>          }
> =20
>          machine->device_memory->base =3D
> -            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, 1ULL <<=
 30);
> +            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, GiB);
> =20


For some reason, GiB got special treatment. Why not 1* GiB?

