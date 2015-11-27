Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2K96-0003CJ-OM
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 09:37:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2K91-00030l-B5
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 09:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2K90-0004In-JZ
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 09:37:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a2K8u-0004GJ-Lw; Fri, 27 Nov 2015 09:36:56 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3F4F9341ADA;
	Fri, 27 Nov 2015 14:36:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAREasd1022759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 27 Nov 2015 09:36:55 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0B904303F16C; Fri, 27 Nov 2015 15:36:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1448626105-29540-2-git-send-email-pbonzini@redhat.com>
Date: Fri, 27 Nov 2015 15:36:53 +0100
In-Reply-To: <1448626105-29540-2-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Fri, 27 Nov 2015 13:08:25 +0100")
Message-ID: <87si3rzeyi.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.5] bt: avoid
	unintended sign extension
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
X-List-Received-Date: Fri, 27 Nov 2015 14:37:07 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> In the case of a 4-byte length, shifting a value by 24 may cause
> an unintended sign extension when converting from int to size_t.
> Use a uint32_t variable instead.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

For 32 bit ssize_t, lengths > 0x7fffffff go to negative, same as before.
*shrug*

Reviewed-by: Markus Armbruster <armbru@redhat.com>

