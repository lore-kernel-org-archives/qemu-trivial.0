Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xycwa-0005nZ-R9
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:48:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycwU-0005bl-Im
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycwP-0003PD-28
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:48:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XycwD-0003MN-Qf; Wed, 10 Dec 2014 03:48:02 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D05A4419AF;
	Wed, 10 Dec 2014 11:47:59 +0300 (MSK)
Message-ID: <548808BF.20407@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:47:59 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Thomas Huth <thuth@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <1413980918-6130-1-git-send-email-thuth@linux.vnet.ibm.com>	<5448028D.4050408@terremark.com>	<20141103135024.5681f929@oc7435384737.ibm.com>
	<20141204125909.03040aaa@oc7435384737.ibm.com>
In-Reply-To: <20141204125909.03040aaa@oc7435384737.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Don Slutz <dslutz@verizon.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] get_maintainer.pl: Remove
 the --git-chief-penguins option
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
X-List-Received-Date: Wed, 10 Dec 2014 08:48:24 -0000

04.12.2014 14:59, Thomas Huth wrote:
>>
>> Ping?
>=20
> Ping again

Thomas, we was in freeze trying to get 2.2 out of the door.
During this time I didn't process -trivial patches, to not
pollute incoming changes stream even further.

Your patch for some reason does not apply to current
state of get_maintainer.pl script, failing this hunk:

>>>> -	foreach my $chief (@penguin_chief) {
>>>> -	    if ($chief =3D~ m/^(.*):(.*)/) {
>>>> -		my $email_address;
>>>> -
>>>> -		$email_address =3D format_email($1, $2, $email_usename);
>>>> -		if ($email_git_penguin_chiefs) {
>>>> -		    push(@email_to, [$email_address, 'chief penguin']);
>>>> -		} else {
>>>> -		    @email_to =3D grep($_->[0] !~ /${email_address}/, @email_to);
>>>> -		}
>>>> -	    }
>>>> -	}
>>>> -

I didn't look at the details, because this is
a trivial delete of a block of code, so I just
deleted it manually.

So I applied your patch now.

Note there's one more reference to penguin chief
left in the code, in get_maintainer_role function.
I don't think it is wrong.

Thanks,

/mjt

