Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGHNC-0007gq-9j
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 01:10:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fGHN9-0007fI-Py
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 01:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fGHN8-0000Ky-Sk
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 01:10:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58158 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fGHN4-00008H-6t; Wed, 09 May 2018 01:10:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8526430A684;
	Wed,  9 May 2018 05:10:29 +0000 (UTC)
Received: from [10.36.116.83] (ovpn-116-83.ams2.redhat.com [10.36.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E093310F1BF6;
	Wed,  9 May 2018 05:10:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1525840700-30635-1-git-send-email-thuth@redhat.com>
	<f0a24157-3aa9-4b51-8870-e83407e85697@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c91c4ff7-85d8-3605-7890-779abebea6fd@redhat.com>
Date: Wed, 9 May 2018 07:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f0a24157-3aa9-4b51-8870-e83407e85697@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 09 May 2018 05:10:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 09 May 2018 05:10:29 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
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
X-List-Received-Date: Wed, 09 May 2018 05:10:40 -0000

On 09.05.2018 07:02, Philippe Mathieu-Daud=C3=A9 wrote:
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

Right ... but what do you do if you just want to fix something in the
generic comments of that file? Who's then responsible for picking up the
patch? ... well, updates to comments could maybe go through
qemu-trivial, too, so I'm also fine if we do not list trace-events in
MAINTAINERS. I'll leave this up to Stefan to decide.

 Thomas

