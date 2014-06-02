Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wra7a-0004O0-8z
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 17:50:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wra7T-0004G2-KI
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 17:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wra7O-0005TP-6S
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 17:50:15 -0400
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b]:35356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wra7D-0005BZ-4r; Mon, 02 Jun 2014 17:49:59 -0400
Received: by mail-wg0-f43.google.com with SMTP id l18so5693670wgh.26
	for <multiple recipients>; Mon, 02 Jun 2014 14:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xsd2M1v16KjU4yp1+mI0BpZHZPeZJbNQYNRP0+VkhpE=;
	b=tTEWo5DHodUapB9sj3Ju7/HGvHcm2EscfIkQFpLqspNVvkyh7JhGcTpc+cGEoNCecN
	O9iXARIA84UyJ8T33GZ8qEYt7nV+1oujTCxk1WYjRHIUah1piGjdPmtz97PSS1LyLPRL
	i4cUzD0GsR0Js5I7q17xlVnayK26qZgUrgWJuAp12oN9k4obShQo/pD6zkjsNxCxo+ki
	FpeUd136uqpDUGK6JFCb7ZPSgbQY+PZ8vTlnLCzmhKzHaTHU8pQ7YbKWMqPs9mArIgoG
	8xOY2rTbOoCxdF/qS4MQwTFUcF46hWb6ho2swMISWKSrfQuZBoCI7UknvNUShinJv4DA
	QeIQ==
X-Received: by 10.194.236.169 with SMTP id uv9mr52153547wjc.46.1401745797778; 
	Mon, 02 Jun 2014 14:49:57 -0700 (PDT)
Received: from Inspiron-3521 ([41.109.203.193])
	by mx.google.com with ESMTPSA id l5sm35866267wif.22.2014.06.02.14.49.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 02 Jun 2014 14:49:56 -0700 (PDT)
Date: Mon, 2 Jun 2014 22:49:50 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20140602214950.GA5283@Inspiron-3521>
References: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
	<20140602122036.GA3049@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140602122036.GA3049@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22b
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, stefanha@redhat.com, xiawenc@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] readline: Clear screen on
	form feed.
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
X-List-Received-Date: Mon, 02 Jun 2014 21:50:21 -0000

On Mon, Jun 02, 2014 at 02:20:36PM +0200, Stefan Hajnoczi wrote:
> On Sun, Jun 01, 2014 at 12:53:35PM +0100, Hani Benhabiles wrote:
> > Signed-off-by: Hani Benhabiles <hani@linux.com>
> > ---
> >  util/readline.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> 
> Please only CC me on patches for areas of the code that I maintain or
> you feel I am an expert in.  That includes block, net, and tracing.
> Monitor and terminal escape sequences isn't my forte :-).

Sure, np. Just used get_maintainer.pl output.

