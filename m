Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fV2Mz-0007pg-1T
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jun 2018 18:11:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fV2Mw-0007oT-UV
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2018 18:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fV2Mw-0004Nt-2C
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2018 18:11:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58198 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fV2Mr-0004GK-Nv; Mon, 18 Jun 2018 18:11:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B6D87DAC3;
	Mon, 18 Jun 2018 22:11:21 +0000 (UTC)
Received: from [10.10.125.119] (ovpn-125-119.rdu2.redhat.com [10.10.125.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D60E97C42;
	Mon, 18 Jun 2018 22:11:16 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Yaowei Bai <baiyaowei@cmss.chinamobile.com>
References: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
	<20180613035030.GB25430@flamenco>
	<23a38716-196f-53a0-0a3d-61f269b1dab4@redhat.com>
	<20180613141510.GA672@byw>
	<20180615173013.GH12972@stefanha-x1.localdomain>
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, laurent@vivier.eu, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4fb174ba-ec91-483e-63ed-ca3c118ae9f8@redhat.com>
Date: Mon, 18 Jun 2018 17:11:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180615173013.GH12972@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 18 Jun 2018 22:11:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 18 Jun 2018 22:11:21 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tracing.txt: add missing
 '-' for trace option
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
X-List-Received-Date: Mon, 18 Jun 2018 22:11:27 -0000

On 06/15/2018 12:30 PM, Stefan Hajnoczi wrote:

>>>
>>> So I'm in favor of this patch, although it may need more of a commit
>>> message summarizing the justification I've just pointed you to.
>>
>> Thanks for your nice explaination. If this patch could be merged i will
>> send V2 with a commit message.
> 
> Please update the remaining occurrences of the -trace option syntax in
> v2:
> 
>    $ git grep -- -trace docs/devel/tracing.txt

Also fixing strings in trace/control.[ch] would be appropriate.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

