Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ethj7-0004Za-EG
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 17:40:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1ethj5-0004Xk-5D
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 17:40:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1ethj4-0000Zo-En
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 17:39:59 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:52860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1ethiz-0000Xm-D0; Wed, 07 Mar 2018 17:39:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 450BB11FC6;
	Wed,  7 Mar 2018 23:39:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkbPQDh8KYgO; Wed,  7 Mar 2018 23:39:51 +0100 (CET)
Received: from var.youpi.perso.aquilenet.fr
	(static-176-158-111-12.ftth.abo.bbox.fr [176.158.111.12])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 6DF5611FE1;
	Wed,  7 Mar 2018 23:39:50 +0100 (CET)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.90_1)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1ethiv-0000k4-Ik; Wed, 07 Mar 2018 23:39:49 +0100
Date: Wed, 7 Mar 2018 23:39:49 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20180307223949.5swn6dhu3bx5e3n5@var.youpi.perso.aquilenet.fr>
References: <20180201093545.33741-1-aik@ozlabs.ru>
	<38e2df74-c7d7-a062-8385-494adae0ef89@ozlabs.ru>
	<727e34b6-0f7f-bd0c-9a34-51d5bc844c73@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727e34b6-0f7f-bd0c-9a34-51d5bc844c73@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 185.233.100.1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] slirp/debug: Print IP
 addresses in human readable form
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
X-List-Received-Date: Wed, 07 Mar 2018 22:40:00 -0000

Hello,

Remember to Cc the maintainer, I just can't read qemu-devel fully to
find slirp mails.

Thomas Huth, on mer. 07 mars 2018 07:24:16 +0100, wrote:
> >> diff --git a/slirp/arp_table.c b/slirp/arp_table.c
> >> index 3547043..bac608f 100644
> >> --- a/slirp/arp_table.c
> >> +++ b/slirp/arp_table.c
> >> @@ -33,7 +33,7 @@ void arp_table_add(Slirp *slirp, uint32_t ip_addr, uint8_t ethaddr[ETH_ALEN])
> >>      int i;
> >>  
> >>      DEBUG_CALL("arp_table_add");
> >> -    DEBUG_ARG("ip = 0x%x", ip_addr);
> >> +    DEBUG_ARG("ip = %s", inet_ntoa(*(struct in_addr *)&ip_addr));

I never like casts :)
And it happens that the standard doesn't say that s_addr is necessarily
the first field of struct in_addr, so better really initialize a struct
in_addr variable and use that (ditto for arp_table_search and
tcp_listen).

Samuel

