Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7J8v-0002S8-6o
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 04:01:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7J8t-0002Rz-5S
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7J8m-00060U-Hs
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:01:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7J8m-00060O-CH
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:01:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 8E1BDB599E;
	Tue, 23 Jun 2015 08:01:07 +0000 (UTC)
Received: from [10.36.112.33] (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N814o3014209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 23 Jun 2015 04:01:06 -0400
Message-ID: <5589123F.8080505@redhat.com>
Date: Tue, 23 Jun 2015 10:01:03 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Scott Feldman <sfeldma@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAE4R7bCCSh6dd_t42rzSiYs_+nEc8FreT2ij1F0iRGem+TjWow@mail.gmail.com>
In-Reply-To: <CAE4R7bCCSh6dd_t42rzSiYs_+nEc8FreT2ij1F0iRGem+TjWow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 23 Jun 2015 08:01:16 -0000



On 23/06/2015 07:23, Scott Feldman wrote:
> +    rocker = g_malloc0(sizeof(*rocker));
> +    if (!rocker) {
> +        error_set(errp, ERROR_CLASS_GENERIC_ERROR, "out-of-memory");
> +        return NULL;
> +    }
> +

g_malloc0 aborts on OOM, so this is not necessary.

Paolo

