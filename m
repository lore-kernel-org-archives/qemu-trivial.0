Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Weh4m-0007pZ-Oh
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 04:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Weh4f-0007gq-A2
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 04:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Weh4Z-0000eS-5Y
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 04:38:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Weh4M-0000c2-Hs; Mon, 28 Apr 2014 04:37:46 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3S8bi6D006716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 28 Apr 2014 04:37:44 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-50.ams2.redhat.com
	[10.36.112.50])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3S8bdBF020616; Mon, 28 Apr 2014 04:37:41 -0400
Message-ID: <535E1353.9010905@redhat.com>
Date: Mon, 28 Apr 2014 10:37:39 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Hani Benhabiles <kroosec@gmail.com>
References: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
	<20140425114033.50333f11@redhat.com> <535A8485.7020809@suse.de>
In-Reply-To: <535A8485.7020809@suse.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s3S8bi6D006716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qmp: Remove unused variable.
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
X-List-Received-Date: Mon, 28 Apr 2014 08:38:11 -0000

Il 25/04/2014 17:51, Andreas F=E4rber ha scritto:
>
> if (ambiguous) {
>     error_setg(errp, "Path '%s' is ambiguous.", path);
> } else {
>     error_set(errp, QERR_DEVICE_NOT_FOUND, path);
> }
>
> My reasoning is that an ambiguous path might deliver unpredictable
> results (whichever it encounters first), across QEMU versions at least.
>
> But I'd like to hear Paolo's opinion, too, since he was involved in
> loosening requirements on paths.

I agree.  I think the only loosening I did was to allow an empty path if=20
the required type is not NULL.

Paolo

