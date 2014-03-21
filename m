Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQv33-00072W-1u
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 04:43:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WQv2w-00072J-Cl
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 04:43:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WQv2q-0001wS-Dt
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 04:43:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WQv2q-0001wE-5p; Fri, 21 Mar 2014 04:43:16 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2L8hCtv017506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Mar 2014 04:43:12 -0400
Received: from [10.36.5.145] (vpn1-5-145.ams2.redhat.com [10.36.5.145])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2L8h9Nn020100; Fri, 21 Mar 2014 04:43:10 -0400
Message-ID: <1395391388.20837.1.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Mar 2014 09:43:08 +0100
In-Reply-To: <alpine.LMD.2.02.1403201057120.1165@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<53232C8C.3070403@msgid.tls.msk.ru>
	<alpine.LMD.2.02.1403141834500.15847@jedlik.phy.bme.hu>
	<alpine.LMD.2.02.1403141856050.15847@jedlik.phy.bme.hu>
	<1395059524.5663.5.camel@nilsson.home.kraxel.org>
	<alpine.LMD.2.02.1403201057120.1165@jedlik.phy.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: Set prog
 interface field of pci config to 16550 compatible
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
X-List-Received-Date: Fri, 21 Mar 2014 08:43:28 -0000

On Do, 2014-03-20 at 10:58 +0100, BALATON Zoltan wrote:
> So what should we do then? Should I send an updated patch which sets 
> 070002 in the multiport case too?

Yes, that would be great.

cheers,
  Gerd


