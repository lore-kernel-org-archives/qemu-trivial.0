Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abUVf-000766-Qw
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 09:45:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abUVd-00074L-IE
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 09:45:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abUVc-0004RH-0B
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 09:45:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abUVX-0004Qh-C8; Thu, 03 Mar 2016 09:45:39 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 2F39A8F4FE;
	Thu,  3 Mar 2016 14:45:38 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23EjZPa008109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 09:45:36 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
	<56CF020A.8030704@cn.fujitsu.com>
	<CAFEAcA9=u6FiqNTw25x3k5uLKZ9QnDqsho2BdfqZ-ybjfRa_fA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D84E0E.5000801@redhat.com>
Date: Thu, 3 Mar 2016 15:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=u6FiqNTw25x3k5uLKZ9QnDqsho2BdfqZ-ybjfRa_fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc/memory.txt: fix typo
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
X-List-Received-Date: Thu, 03 Mar 2016 14:45:47 -0000



On 25/02/2016 15:24, Peter Maydell wrote:
> Probably what happened
> was that when the API was being designed it started off with an
> 'unaligned' field, and then later the field name and semantics
> were changed but the docs weren't updated to match. My point was
> that just changing the name without looking at the behaviour we're
> actually implementing isn't correct.

Peter, are you okay with adding your S-o-b and authorship to
this patch?

I'll add a Reported-by for Cao jin, too.

Paolo

diff --git a/docs/memory.txt b/docs/memory.txt
index d0aca05..e44d081 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -297,8 +297,9 @@ various constraints can be supplied to control how these callbacks are called:
  - .valid.min_access_size, .valid.max_access_size define the access sizes
    (in bytes) which the device accepts; accesses outside this range will
    have device and bus specific behaviour (ignored, or machine check)
- - .valid.aligned specifies that the device only accepts naturally aligned
-   accesses.  Unaligned accesses invoke device and bus specific behaviour.
+ - .valid.unaligned specifies that the *device being modelled* supports
+    unaligned accesses; if false, unaligned accesses will invoke the
+    appropriate bus or CPU specific behaviour.
  - .impl.min_access_size, .impl.max_access_size define the access sizes
    (in bytes) supported by the *implementation*; other access sizes will be
    emulated using the ones available.  For example a 4-byte write will be
@@ -307,4 +308,4 @@ various constraints can be supplied to control how these callbacks are called:
    accesses; if false, unaligned accesses will be emulated by two aligned
    accesses.
  - .old_mmio can be used to ease porting from code using
-   cpu_register_io_memory(). It should not be used in new code.
+   cpu_register_io_memory() and the like. It should not be used in new code.

