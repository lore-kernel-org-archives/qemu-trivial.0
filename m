Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bYDbm-0002S3-58
	for mharc-qemu-trivial@gnu.org; Fri, 12 Aug 2016 10:38:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bYDbj-0002Og-02
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 10:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bYDbi-00006Z-50
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 10:38:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bYDbV-0008Ts-OT; Fri, 12 Aug 2016 10:38:33 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56EDD3B3E7;
	Fri, 12 Aug 2016 08:42:19 +0000 (UTC)
Received: from [10.36.112.24] (ovpn-112-24.ams2.redhat.com [10.36.112.24])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7C8gG5s010389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Aug 2016 04:42:17 -0400
To: Markus Armbruster <armbru@redhat.com>, Colin Lord <clord@redhat.com>
References: <1470420195-32551-1-git-send-email-clord@redhat.com>
	<87zioniw9x.fsf@dusky.pond.sub.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, peter.maydell@linaro.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <04b7f702-5ac1-fcc2-7968-5bcb8767b2d2@redhat.com>
Date: Fri, 12 Aug 2016 10:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <87zioniw9x.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 12 Aug 2016 08:42:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] help: Update help to
 reflect that GTK is the default
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
X-List-Received-Date: Fri, 12 Aug 2016 14:38:48 -0000



On 08/08/2016 08:56, Markus Armbruster wrote:
> Aside: -nographic is hard to understand because it does too many things.

-nographic is "just" -serial mon:stdio -machine graphics=false -display
none. :)

Paolo

