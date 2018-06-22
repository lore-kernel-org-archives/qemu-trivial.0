Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWLEN-0003bt-C2
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 08:31:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fWLEL-0003aB-Cb
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fWLEK-0005T9-9E
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:31:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45488 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fWLEE-0005RG-Um; Fri, 22 Jun 2018 08:31:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5211DA5002;
	Fri, 22 Jun 2018 12:31:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01C8A2156700;
	Fri, 22 Jun 2018 12:31:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 27F0B97CA0; Fri, 22 Jun 2018 14:31:49 +0200 (CEST)
Date: Fri, 22 Jun 2018 14:31:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20180622123149.qxirhe6uajzkc22s@sirius.home.kraxel.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
	<20180621171257.14897-6-f4bug@amsat.org>
	<20180622062225.ay4bubgshxjj3uey@sirius.home.kraxel.org>
	<3a5e52f6-3b65-5ce8-f5d2-48b76e3e4f21@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5e52f6-3b65-5ce8-f5d2-48b76e3e4f21@amsat.org>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 12:31:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 12:31:50 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 05/11] hw/display/cirrus: Convert
 printf() calls to trace events
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
X-List-Received-Date: Fri, 22 Jun 2018 12:31:58 -0000

> > Indention looks weird.
> 
> Actually this is the code around that is weirdly intended, a mix of
> <tab> and <spaces>.

Ok.

> Do you prefer a previous indent cleanup patch or can I add your Acked-by
> tag?

Leave as is.  Breaking "git blame" with a whitespace cleanup is not
useful indeed.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd


