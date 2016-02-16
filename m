Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVj20-0000Ub-31
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 12:03:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aVj1u-0000J6-6X
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 12:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aVj1o-0005yr-Mi
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 12:03:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aVj1g-0005xS-Hv; Tue, 16 Feb 2016 12:03:00 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 0D3B95275B;
	Tue, 16 Feb 2016 17:03:00 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1GH2tsp015511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Feb 2016 12:02:58 -0500
To: Laszlo Ersek <lersek@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
	<56C34F18.7090006@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56C3562C.8000503@redhat.com>
Date: Tue, 16 Feb 2016 18:02:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56C34F18.7090006@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Improve
 documentation of chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 17:03:18 -0000



On 16/02/2016 17:32, Laszlo Ersek wrote:
> I'm a big fan of muxing the stdio backend between the (human) monitor
> and the guest's serial console:
> 
>   -chardev stdio,signal=off,mux=on,id=char0 \
>   -mon chardev=char0,mode=readline,default \
>   -serial chardev:char0 \

Or just "-serial mon:stdio". :)

Paolo

