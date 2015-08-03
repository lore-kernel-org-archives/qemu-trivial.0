Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMFzM-0006sA-74
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 09:41:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZMFzJ-0006o6-9d
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 09:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZMFzI-00021d-Ef
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 09:41:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZMFzA-00020R-1z; Mon, 03 Aug 2015 09:41:00 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 4BB2B4F;
	Mon,  3 Aug 2015 13:40:59 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t73Detx7019002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 3 Aug 2015 09:40:57 -0400
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55BF6F68.1090103@redhat.com>
Date: Mon, 3 Aug 2015 15:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 01/11] tcg: add ability to dump
 /tmp/perf-<pid>.map files
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
X-List-Received-Date: Mon, 03 Aug 2015 13:41:10 -0000



On 03/08/2015 11:14, Alex Benn=C3=A9e wrote:
> This allows the perf tool to map samples to each individual translation
> block. This could be expanded for user space but currently it gives
> enough information to find any hotblocks by other means.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

What happens if you encounter a tb_flush?

Paolo

