Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQAXs-0006PX-1Z
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 03:04:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQAXi-0006P7-RQ
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 03:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQAXa-0007f1-As
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 03:04:02 -0400
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229]:58981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQAXa-0007d0-4X; Wed, 19 Mar 2014 03:03:54 -0400
Received: by mail-ee0-f41.google.com with SMTP id t10so6295306eei.28
	for <multiple recipients>; Wed, 19 Mar 2014 00:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=qXwwDYIo7Y6ShLmTCwZqJE3+YO3Na52tTPlx9s6o+pE=;
	b=hv+vyvii1zgOjY3G697uT/s7V3rFYuEEhj7Wr6d0VYb6j5soDvhyJDy9Dds1lpGNV1
	firlUmEMWy4uYulTZmmTvY9qGeVLgLWIuks49HsWiL6YbDXFE8dq9maSjeZNyu25ZBC5
	UUM76dFsV3FQUP1PJq8rVPJcKE2So305WEHru69TZhvA9Q+dQbJBWq+Q/s0xn30UhxwR
	9cYE0cKi0ysptO0807KEL8ALcDoJGc/U3zPIH2zd+eY47wnjM/YKBl17Nw62O4C0/yp2
	Wy8WRt6aUZxZj8qL0iT0O3cw44jOus78lJkzZtWJe77UlRko9Qu8VcDGV237QnBXs2al
	WR7g==
X-Received: by 10.15.41.140 with SMTP id s12mr34386158eev.4.1395212633000;
	Wed, 19 Mar 2014 00:03:53 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id
	x45sm52720984eef.15.2014.03.19.00.03.50 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 00:03:51 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53294155.8040403@redhat.com>
Date: Wed, 19 Mar 2014 08:03:49 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
	<874n2vcpu9.fsf@blackfin.pond.sub.org>
In-Reply-To: <874n2vcpu9.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] scripts: add sample model file for
	Coverity Scan
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
X-List-Received-Date: Wed, 19 Mar 2014 07:04:11 -0000

Il 18/03/2014 19:40, Markus Armbruster ha scritto:
> > +void *
> > +g_malloc (size_t n_bytes)
> > +{
> > +    void *mem;
> > +    __coverity_negative_sink__((ssize_t) n_bytes);
> > +    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
> > +    if (!mem) __coverity_panic__ ();
> > +    return mem;
> > +}
>
> This isn't quite honest: g_malloc(0) yields NULL.  Same for the other
> allocation functions.

Oh, I didn't know that.

It probably would make static analysis a bit less powerful or will 
return more false positives.  The NULL return for realloc (in the "free" 
case) already causes some.  So I'm undecided between a more correct 
model and a more selective one (with a fat comment).

Paolo

