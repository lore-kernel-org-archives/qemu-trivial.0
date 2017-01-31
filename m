Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYbj2-0007O8-1c
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 11:56:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cYbj0-0007ME-3a
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 11:56:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cYbiz-0003Wy-8M
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 11:56:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1cYbit-0003JG-Ub; Tue, 31 Jan 2017 11:56:04 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B12237FB62;
	Tue, 31 Jan 2017 16:56:03 +0000 (UTC)
Received: from redhat.com (ovpn-117-115.ams2.redhat.com [10.36.117.115])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0VGtwP4007169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 31 Jan 2017 11:56:01 -0500
Date: Tue, 31 Jan 2017 16:55:57 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Message-ID: <20170131165557.GE20303@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 31 Jan 2017 16:56:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 16:56:11 -0000

On Tue, Jan 31, 2017 at 04:14:47PM +0000, Peter Maydell wrote:
> We already require gcc 4.1 or newer (for the atomic
> support), so the fallback codepaths for older gcc
> versions than that are now dead code and we can
> just delete them.

Do we have any explicit check alreadu for 4.1, or do we
just let the build fail on the atomic code ?

IOW, is there any use in having..

#if !QEMU_GNUC_PREREQ(4, 1)
# error "QEMU requires GCC >= 4.1 or CLang"
#endif

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|

