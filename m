Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzmsJ-0001Da-IJ
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 10:09:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YzmsH-0001BU-7N
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 10:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YzmsG-0003Td-DA
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 10:09:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YzmsC-0003SP-2v; Tue, 02 Jun 2015 10:08:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C738D379E30;
	Tue,  2 Jun 2015 14:08:55 +0000 (UTC)
Received: from [10.36.112.77] (ovpn-112-77.ams2.redhat.com [10.36.112.77])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52E8qPC018050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 2 Jun 2015 10:08:54 -0400
Message-ID: <556DB8F3.3000204@redhat.com>
Date: Tue, 02 Jun 2015 16:08:51 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
References: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>
	<55684995.3070205@redhat.com> <877frrii83.fsf@linaro.org>
	<556893DB.9030502@redhat.com>
	<556D43C4.2070309@msgid.tls.msk.ru> <87vbf6bkua.fsf@linaro.org>
In-Reply-To: <87vbf6bkua.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: don't apply -O2 if
	extra-cflags sets -O
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
X-List-Received-Date: Tue, 02 Jun 2015 14:09:02 -0000



On 02/06/2015 10:01, Alex Benn=C3=A9e wrote:
>=20
> Michael Tokarev <mjt@tls.msk.ru> writes:
>=20
>> 29.05.2015 19:29, Paolo Bonzini wrote:
>>> On 29/05/2015 16:14, Alex Benn=C3=A9e wrote:
>>>> You mean just do:
>>>>
>>>> diff --git a/configure b/configure
>>>> index b707429..f13831a 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -353,7 +353,7 @@ for opt do
>>>>    ;;
>>>>    --cpu=3D*) cpu=3D"$optarg"
>>>>    ;;
>>>> -  --extra-cflags=3D*) QEMU_CFLAGS=3D"$optarg $QEMU_CFLAGS"
>>>> +  --extra-cflags=3D*) QEMU_CFLAGS=3D"$QEMU_CFLAGS $optarg"
>>>>                      EXTRA_CFLAGS=3D"$optarg"
>>>>    ;;
>>>>    --extra-ldflags=3D*) LDFLAGS=3D"$optarg $LDFLAGS"
>>>>
>>>> I guess at the time I was trying to be clean and avoiding multiple -=
O
>>>> calls. But I guess that will have the same effect.
>>>
>>> Yes, that.  Most other QEMU_CFLAGS assignments add at the beginning, =
so
>>> I guess the remaining ones (including the --extra-cflags one) should =
too.
>>
>> So, what's the final version of this patch?
>=20
> I can send the second patch but I'm wary about changing all instances t=
o
> QEMU_CFLAGS to append additional flags.

Sure, that's a separate change.

Paolo

