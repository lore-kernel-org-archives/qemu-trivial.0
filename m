Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRMLZ-0004PN-T4
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 11:01:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aRMLU-0004Ey-7O
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 11:01:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aRMLQ-0000lz-3R
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 11:01:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aRMLI-0000ke-IZ; Thu, 04 Feb 2016 11:01:12 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 2713C35417C;
	Thu,  4 Feb 2016 16:01:12 +0000 (UTC)
Received: from [10.34.129.233] (dhcp129-233.brq.redhat.com [10.34.129.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u14G182q020606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 4 Feb 2016 11:01:10 -0500
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1454583838-22272-1-git-send-email-pbonzini@redhat.com>
	<20160204152749.GE2427@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56B375C3.9070406@redhat.com>
Date: Thu, 4 Feb 2016 17:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160204152749.GE2427@work-vm>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: move
	page_cache.c to migration/
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
X-List-Received-Date: Thu, 04 Feb 2016 16:01:28 -0000



On 04/02/2016 16:27, Dr. David Alan Gilbert wrote:
> tests/test-xbzrle$(EXESUF): tests/test-xbzrle.o migration/xbzrle.o page_cache.o $(test-util-obj-y)
> 
> I'm OK with moving this, although I didn't when I moved everything
> else because there's nothing stopping anyone using it outside of migration.

Oops...

Paolo

