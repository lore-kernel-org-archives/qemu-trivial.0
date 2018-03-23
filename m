Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezLzr-0001md-77
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 08:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezLzl-0001kF-JZ
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 08:40:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezLzk-0005Hw-OG
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 08:40:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46662 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezLzT-00054R-Hg; Fri, 23 Mar 2018 08:40:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C65CF77068;
	Fri, 23 Mar 2018 12:40:14 +0000 (UTC)
Received: from [10.40.204.35] (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D09962023231;
	Fri, 23 Mar 2018 12:40:08 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>, 
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Eric Blake <eblake@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Reitz <mreitz@redhat.com>, 
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <e5a6598a-6a0f-5dbf-f7ab-6ade2059fcce@redhat.com>
Date: Fri, 23 Mar 2018 13:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:40:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:40:14 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 0/4] coccinelle: re-run scripts from
 scripts/coccinelle
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
X-List-Received-Date: Fri, 23 Mar 2018 12:40:37 -0000

On 23/03/2018 13:37, Michael Tokarev wrote:
> 22.03.2018 19:12, Laurent Vivier wrote:
>> I've re-run some scripts from the coccinelle directory,
>> and they have found some problems.
>>
>> This series fixes them.
>>
>> Laurent Vivier (4):
>>   error: Strip trailing '\n' from error string arguments (again again)
>>   error: Remove NULL checks on error_propagate() calls
>>   qdict: remove useless cast
>>   Remove unnecessary variables for function return value
> 
> I've applied patches 1-3, but the 4th patch is a bit.. interesting.
> As has already been said, it touches auto-generated files, which is
> sort of fine, but it _also_ removes comments, which - I think - is
> quite a bit wrong.
> 
> I can apply just selected hunks, but.. hmm..

Thank you, I'm going to rework this one.

Thanks,
Laurent

