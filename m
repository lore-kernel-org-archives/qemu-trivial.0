Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPqYi-00017y-Hi
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jun 2017 09:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPqYg-00016U-Gu
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPqYf-0000Bs-Jg
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:29:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dPqYa-0008Ss-GB; Tue, 27 Jun 2017 09:29:28 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 939E842060;
	Tue, 27 Jun 2017 16:29:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 56F565EF;
	Tue, 27 Jun 2017 16:29:27 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
References: <20170623164557.11636-1-f4bug@amsat.org>
	<20170623164557.11636-2-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <749af2f9-2475-dd6a-5a45-cccb9428ca7b@msgid.tls.msk.ru>
Date: Tue, 27 Jun 2017 16:29:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170623164557.11636-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 1/3] elf-loader: warn about invalid
 endianess
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
X-List-Received-Date: Tue, 27 Jun 2017 13:29:35 -0000

23.06.2017 19:45, Philippe Mathieu-Daud=C3=A9 wrote:
> fprintf(stderr) is how errors are reported in this file.

Applied to -trivial (with typo fix), thanks!

/mjt

