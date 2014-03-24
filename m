Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS5pJ-0002pW-8g
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 10:26:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WS5pB-0002ck-96
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 10:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WS5p5-0003lH-CH
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 10:26:01 -0400
Received: from cantor2.suse.de ([195.135.220.15]:52145 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WS5om-0003fg-TK; Mon, 24 Mar 2014 10:25:37 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5BC8FABB0;
	Mon, 24 Mar 2014 14:25:36 +0000 (UTC)
Message-ID: <5330405F.7040306@suse.de>
Date: Mon, 24 Mar 2014 15:25:35 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-2-git-send-email-prasadjoshi.linux@gmail.com>
In-Reply-To: <1395566923-5074-2-git-send-email-prasadjoshi.linux@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: peter.maydell@linaro.org, aliguori@amazon.com, aik@ozlabs.ru,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, agraf@suse.de,
	v.maffione@gmail.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, av1474@comtv.ru, stefanha@redhat.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/6] intc/openpic_kvm: fix
 MemListener delete regiion callback function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2014 14:26:07 -0000

Am 23.03.2014 10:28, schrieb Prasad Joshi:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  hw/intc/openpic_kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for spotting this, applied to ppc-next (w/ typo fix in subject):
https://github.com/afaerber/qemu-cpu/commits/ppc-next

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

