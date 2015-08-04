Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMZ3Y-0000wo-Nq
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 06:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZMZ3V-0000sO-Kx
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 06:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZMZ3S-00030h-VH
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 06:02:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZMZ3J-0002LW-B6; Tue, 04 Aug 2015 06:02:33 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 89F9FADAC8;
	Tue,  4 Aug 2015 10:02:31 +0000 (UTC)
Received: from [10.36.112.59] (ovpn-112-59.ams2.redhat.com [10.36.112.59])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t74A2Rpc026610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 4 Aug 2015 06:02:28 -0400
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
	<55BF6F68.1090103@redhat.com> <87k2tblcxq.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55C08DB2.1040207@redhat.com>
Date: Tue, 4 Aug 2015 12:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87k2tblcxq.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, qemu-devel@nongnu.org,
	rth@twiddle.net
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
X-List-Received-Date: Tue, 04 Aug 2015 10:02:46 -0000



On 04/08/2015 09:39, Alex Benn=C3=A9e wrote:
> At the point of a tb_flush all bets are off as we will re-generate all
> the blocks at potentially different locations in the translation buffer=
.
> However for most analysis cases you are unlikely to cause the code
> buffer to overflow. Most other uses of tb_flush are the result
> debugging.
>=20
> I could add a printf when --perfmap is enabled to flag when a flush
> happens to signal to the user? I guess some more caveats in the flag
> description wouldn't hurt.
>=20
> We could consider truncating and re-starting the JIT dump at each flush=
?

Yes, it makes sense to me.  printf + truncation would work.

Paolo

