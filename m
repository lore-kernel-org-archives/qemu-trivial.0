Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGOYp-0005K2-MR
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 08:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fGOYn-0005J9-QS
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 08:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fGOYn-0003Yy-0d
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 08:51:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41340 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fGOYi-0003Se-Kv; Wed, 09 May 2018 08:51:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BAB240200A1;
	Wed,  9 May 2018 12:51:04 +0000 (UTC)
Received: from [10.10.122.205] (ovpn-122-205.rdu2.redhat.com [10.10.122.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5DBF2166BAD;
	Wed,  9 May 2018 12:51:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <1525840700-30635-1-git-send-email-thuth@redhat.com>
	<f0a24157-3aa9-4b51-8870-e83407e85697@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <19e850ef-5384-280b-8d22-c9a776ccbc20@redhat.com>
Date: Wed, 9 May 2018 07:51:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f0a24157-3aa9-4b51-8870-e83407e85697@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 09 May 2018 12:51:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 09 May 2018 12:51:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Add
 trace-events and qemu-option-trace.texi to tracing section
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
X-List-Received-Date: Wed, 09 May 2018 12:51:10 -0000

On 05/09/2018 12:02 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
> On 05/09/2018 01:38 AM, Thomas Huth wrote:
>> The "trace-events" and "qemu-option-trace.texi" files in the top direc=
tory
>> are currently "unmaintained" according to scripts/get_maintainer.pl. T=
hey
>> obviously belong to the Tracing section, so add an entry for them ther=
e.
>=20
> I agree qemu-option-trace.texi belongs to the Tracing section,
> however I think trace-events is not specific to Tracing but belongs to
> everybody maintaining a C file in the top directory... Since they'll
> need to modify this file.

I'd rather hear Stefan's opinion before outright nixing the addition of=20
trace-events to his section - personally, I think any patch touching a=20
trace-events is fair game for review by the tracing tree, even if it=20
ends up going in through another tree.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

