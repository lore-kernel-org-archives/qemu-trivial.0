Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCaf-0007Ez-1Q
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 09:06:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCaa-00072y-23
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 09:06:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCaZ-0001t9-3F
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 09:06:35 -0500
Received: from mail-bk0-f47.google.com ([209.85.214.47]:52728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TwCaN-0001rV-KW; Fri, 18 Jan 2013 09:06:23 -0500
Received: by mail-bk0-f47.google.com with SMTP id j4so2020584bkw.34
	for <multiple recipients>; Fri, 18 Jan 2013 06:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YNC1nMJykshS5kMFSoHQOu0KVdUPphE/TqpSM5pPU7U=;
	b=X7XsK7mkrRO3HdOW7J4FqFE8eMFGh2EMR9iLIrLYwviyRjtDNVgNA7FdMKhjORufVS
	L9a0ZD4dfzY0SKbJIeGrGr3bcRBULkfO1GRZy/IEAcuS1UOuK9UX18FEIFrz/0afwsGR
	79t3bzTvb96J4oK7TbRcIMiYugwmUM51KZk/fxk1/qXL9mf3taxwk9ssHwFb3Bqy7qRJ
	KedMOKmtwuaAg34JzrQOuQjhJrSnJyPrNtOLLOdozfkMIueEXF/JbCL2b1NcTgsWEUqJ
	+qK/C6TwL1N7AVlHME8t+o3rXIHK63pEIfD7N+Qy7pGWe37Nhc7nvwt8k5fLIuyZDMWs
	ESsg==
X-Received: by 10.204.147.79 with SMTP id k15mr2488129bkv.55.1358517982637;
	Fri, 18 Jan 2013 06:06:22 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id s10sm1266654bkw.3.2013.01.18.06.06.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 06:06:21 -0800 (PST)
Date: Fri, 18 Jan 2013 15:06:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Vadim Evard <v.e.evard@gmail.com>
Message-ID: <20130118140619.GA28079@stefanha-thinkpad.redhat.com>
References: <50F95294.1000400@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50F95294.1000400@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.47
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: silence
 pkg-config's check for curses
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
X-List-Received-Date: Fri, 18 Jan 2013 14:06:38 -0000

On Fri, Jan 18, 2013 at 05:48:04PM +0400, Vadim Evard wrote:
> Signed-off-by: Vadim Evard <v.e.evard@gmail.com>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

