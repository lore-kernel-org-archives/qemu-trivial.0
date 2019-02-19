Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw9bx-0003Ck-74
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:55:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9bv-0003Ao-IN
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:55:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9bt-00038L-Jv
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:55:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gw9br-00035I-TB; Tue, 19 Feb 2019 12:55:12 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90F061CFF42;
	Tue, 19 Feb 2019 17:55:09 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24886101E84B;
	Tue, 19 Feb 2019 17:55:05 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-2-richardw.yang@linux.intel.com>
	<e59b0920-4698-a0d1-7990-77d9e2202f9b@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <83037dad-5d57-2ebd-0038-27dd38975d3f@redhat.com>
Date: Tue, 19 Feb 2019 11:55:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <e59b0920-4698-a0d1-7990-77d9e2202f9b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 19 Feb 2019 17:55:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] CODING_STYLE: specify
 the indent rule for multiline code
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
X-List-Received-Date: Tue, 19 Feb 2019 17:55:16 -0000

On 2/19/19 11:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:

>=20
> What is still unclear is what to do when a function name is over 60
> characters (you follow a library/API and can not shorten it), for examp=
le:
>=20
> static void ccid_card_vscard_handle_message(PassthruState *card,
>     const VSCMsgHeader *scr_msg_header);
>=20
> What is the project guideline in this case?

I don't know that we have an official guideline, but I've seen enough
code doing that. I've also seen this style:

static void long_func_name(
    parameter one, parameter two)
{
    if (condition) {
        call_some_really_long_name(
            arg1,
            arg2);
    }

where even the first argument is put at an indentation of 4 from the
primary line.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

