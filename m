Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WjnTk-0005h8-La
	for mharc-qemu-trivial@gnu.org; Mon, 12 May 2014 06:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1WjnTd-0005SM-3u
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 06:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1WjnTJ-0003LT-ST
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 06:28:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1WjnSR-00033E-SL; Mon, 12 May 2014 06:27:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4CARfxv029602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 12 May 2014 06:27:41 -0400
Received: from localhost (ovpn-116-35.ams2.redhat.com [10.36.116.35])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4CAReCF016943; Mon, 12 May 2014 06:27:40 -0400
From: Juan Quintela <quintela@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
In-Reply-To: <536E20CC.4030401@gmail.com> (Chen Gang's message of "Sat, 10 May
	2014 20:51:24 +0800")
References: <536E20CC.4030401@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
Date: Mon, 12 May 2014 12:27:38 +0200
Message-ID: <87ha4v8f6t.fsf@elfo.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: mst@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>, mjt@tls.msk.ru,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	pbonzini@redhat.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Simplify code for
	load_xbzrle()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 10:29:03 -0000

Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> For xbzrle_decode_buffer(), when decoding contents will exceed writing
> buffer, it will return -1, so need not check the return value whether
> large than writing buffer.
>
> And when failure occurs within load_xbzrle(), it always return -1
> without any resources which need release.
>
> So can remove the related checking statements, and also can remove 'rc'
> and 'ret' local variables,
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

