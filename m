Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1emKGo-0005Vq-Qd
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2018 09:12:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1emKGm-0005SV-9J
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 09:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1emKGl-0007I6-Cs
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 09:12:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58358 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1emKGf-0007Eg-W0; Thu, 15 Feb 2018 09:12:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B77280D2EC8;
	Thu, 15 Feb 2018 14:11:59 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC0E2026E0E;
	Thu, 15 Feb 2018 14:11:52 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>
References: <1518629505-22480-1-git-send-email-thuth@redhat.com>
	<9a9ac3ae-5974-f462-7321-9ae2ad5b78ae@redhat.com>
	<933068e0-7928-389b-f927-15df79506bc6@redhat.com>
	<20180215100812.GC3322@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5e448490-3a13-dd85-ded6-f9fa582d3901@redhat.com>
Date: Thu, 15 Feb 2018 08:11:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215100812.GC3322@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 15 Feb 2018 14:11:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 15 Feb 2018 14:11:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add missing
 space when using --with-pkgversion
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 14:12:17 -0000

On 02/15/2018 04:08 AM, Daniel P. Berrang=C3=A9 wrote:

>>> Hmm - here you're changing who supplies the ().=C2=A0 But that argues=
 that
>>> maybe the callsites should supply " (" and ")" themselves.
>>
>> Yeah, that's likely the saner way to do this. The question is: What
>> about the query-version QMP command? Should it report parentheses or
>> not? I think I'd look nicer if it reports "package": "foo" instead of
>> "package": "(foo)" - but we maybe could break some users who expect
>> parentheses there (no matter whether there is a preceding space or not=
)?
>=20
> The pkgversion is an opaque string - users/apps should never try to
> interpret its contents, because its format can vary arbitrarily between
> distros.  It is merely intended as an informative string to help the
> package maintainer identify which version of QEMU was used when someone
> submits a bug reoprt.
>=20
> IOW it is totally valid to change the command to omit '()', and if anyt=
hing
> breaks that is their own fault for trying to interpret an opaque blob o=
f
> data.

Agreed - the fact that we had a leading space in the QMP output for a=20
long time (and even inconsistent at whether it was there), with no one=20
noticing, means that dropping the () from QMP won't hurt anyone.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

