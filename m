Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmMGV-0007s5-TA
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2015 09:38:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1ZmIIK-0004rm-3T
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 05:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1ZmIIJ-0003Bb-Cu
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 05:24:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1ZmIID-00039V-Fy; Wed, 14 Oct 2015 05:24:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 539DCAEF1A;
	Wed, 14 Oct 2015 09:24:16 +0000 (UTC)
Received: from javelin (vpn1-6-188.sin2.redhat.com [10.67.6.188])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9E9OAGd016133
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 14 Oct 2015 05:24:12 -0400
Date: Wed, 14 Oct 2015 14:54:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <20151014080902.GA4281@noname.str.redhat.com>
Message-ID: <alpine.LFD.2.20.1510141450320.13131@wniryva>
References: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
	<alpine.LFD.2.20.1510141207460.9023@wniryva>
	<20151014080902.GA4281@noname.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 14 Oct 2015 09:38:46 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: Fix buffer
 overflows in gdb_handle_packet()
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
X-List-Received-Date: Wed, 14 Oct 2015 09:24:25 -0000

+-- On Wed, 14 Oct 2015, Kevin Wolf wrote --+
| >  Ie host gdb(1) user would need to 
| > supply len/2 value to read/write 'len' bytes.
| 
| That's just how the gdb protocol works. Binary data is transferred as a
| string of hex digits, with every byte being represented by two digits.
| The requested length is in bytes of binary data, so the length of the
| actually transferred data on the wire is indeed double that length.

  I see, got it.

Thank you.
--
 - P J P
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F

