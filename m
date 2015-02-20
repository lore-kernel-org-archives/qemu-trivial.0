Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOsVV-0000EJ-Cd
	for mharc-qemu-trivial@gnu.org; Fri, 20 Feb 2015 13:40:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1YOr0f-0005rR-W4
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 12:05:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1YOr0a-0006Nk-Hq
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 12:05:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>)
	id 1YOr0U-0006KX-1e; Fri, 20 Feb 2015 12:04:50 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1KH4lpB001330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 20 Feb 2015 12:04:47 -0500
Received: from potion (dhcp-1-101.brq.redhat.com [10.34.1.101])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t1KH4iuP029472; Fri, 20 Feb 2015 12:04:45 -0500
Received: by potion (sSMTP sendmail emulation); Fri, 20 Feb 2015 18:04:44 +0100
Date: Fri, 20 Feb 2015 18:04:44 +0100
From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20150220170443.GD3974@potion.brq.redhat.com>
References: <1424448376-15599-1-git-send-email-rkrcmar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1424448376-15599-1-git-send-email-rkrcmar@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Fri, 20 Feb 2015 13:40:55 -0500
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Walle <michael@walle.cc>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 0/2] Fix GCC 5.0.0 build errors
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
X-List-Received-Date: Fri, 20 Feb 2015 17:05:03 -0000

Cc: qemu-trivial@nongnu.org

