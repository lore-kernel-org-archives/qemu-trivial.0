Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aMZwC-0004QT-Ee
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jan 2016 06:31:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aMZw5-0004DO-2a
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 06:31:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aMZw3-0006QJ-V4
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 06:31:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aMZvz-0006PK-NT; Fri, 22 Jan 2016 06:31:19 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3451B5714;
	Fri, 22 Jan 2016 11:31:19 +0000 (UTC)
Received: from redhat.com (dhcp-1-180.lcy.redhat.com [10.32.224.180])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0MBVG2J029089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Jan 2016 06:31:18 -0500
Date: Fri, 22 Jan 2016 11:31:16 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160122113116.GF14825@redhat.com>
References: <1453462113-27119-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1453462113-27119-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-sockets: simplify
	error handling
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jan 2016 11:31:30 -0000

On Fri, Jan 22, 2016 at 12:28:33PM +0100, Paolo Bonzini wrote:
> Just go always through the err label.  (Noticed because Coverity
> complains that peer is always non-NULL in the error cleanup code,
> but removing the "if" is arguably more prone to introducing the
> opposite bug in the future).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

