Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Weh5X-0000LY-86
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 04:38:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Weh5P-000087-B1
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 04:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Weh5J-0000nz-74
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 04:38:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Weh56-0000lW-H0; Mon, 28 Apr 2014 04:38:32 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3S8cVRp025294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 28 Apr 2014 04:38:31 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-50.ams2.redhat.com
	[10.36.112.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3S8cRR4013008; Mon, 28 Apr 2014 04:38:28 -0400
Message-ID: <535E1383.1090700@redhat.com>
Date: Mon, 28 Apr 2014 10:38:27 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, =?ISO-8859-1?Q?Andreas_F=E4rbe?=
	=?ISO-8859-1?Q?r?= <afaerber@suse.de>
References: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
	<20140425114033.50333f11@redhat.com> <535A8485.7020809@suse.de>
	<20140426004616.GA3514@Inspiron-3521>
In-Reply-To: <20140426004616.GA3514@Inspiron-3521>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
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
X-List-Received-Date: Mon, 28 Apr 2014 08:38:57 -0000

Il 26/04/2014 02:46, Hani Benhabiles ha scritto:
>> if (ambiguous) {
>> >     error_setg(errp, "Path '%s' is ambiguous.", path);
>> > } else {
>> >     error_set(errp, QERR_DEVICE_NOT_FOUND, path);
>> > }
>> >
> Probably, you meant something like this:
>
> if (ambiguous) {
>     error_set(errp, QERR_AMBIGUOUS_PATH, path);
> } else if (!obj) {
>     error_set(errp, QERR_DEVICE_NOT_FOUND, path);
> }
>
>

No, error_set is being phased out.  New errors typically use error_setg 
instead.

Paolo

