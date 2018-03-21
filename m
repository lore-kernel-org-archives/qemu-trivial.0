Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eydhg-0002Cq-GF
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 09:22:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1eydhe-0002At-9D
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:22:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1eydha-0004UP-By
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:22:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55714 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1eydhV-0004QS-4s; Wed, 21 Mar 2018 09:22:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B5204001852;
	Wed, 21 Mar 2018 13:22:44 +0000 (UTC)
Received: from [10.40.204.35] (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15E41200BCA1;
	Wed, 21 Mar 2018 13:22:42 +0000 (UTC)
To: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jose Ricardo Ziviani
	<joserz@linux.vnet.ibm.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
References: <20180321120853.14293-1-lvivier@redhat.com>
	<5193a40a-33fb-5b55-5fea-608a5573980e@linux.vnet.ibm.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <7e3215e0-aa21-e2ae-7d07-c07ef66360fe@redhat.com>
Date: Wed, 21 Mar 2018 14:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5193a40a-33fb-5b55-5fea-608a5573980e@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 21 Mar 2018 13:22:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 21 Mar 2018 13:22:44 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: display cause of
 write failure
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
X-List-Received-Date: Wed, 21 Mar 2018 13:22:55 -0000

On 21/03/2018 14:16, Daniel Henrique Barboza wrote:
> Laurent,
> 
> There is already a v3 version of Yasmin's patch that was approved and
> it is supposedly waiting to be merged:
> 
> http://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03035.html

Ok, sorry, I've missed it because the subject line changed between v2
and v3.

Thanks,
Laurent

