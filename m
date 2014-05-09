Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WilTq-0003qY-65
	for mharc-qemu-trivial@gnu.org; Fri, 09 May 2014 10:08:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WilTj-0003i0-2G
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 10:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WilTc-00079x-VN
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 10:08:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WilTQ-00078I-De; Fri, 09 May 2014 10:08:28 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s49E82NH008203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 9 May 2014 10:08:02 -0400
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s49E7xj9023729; Fri, 9 May 2014 10:07:59 -0400
Message-ID: <1399644478.5213.64.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 09 May 2014 16:07:58 +0200
In-Reply-To: <1399641773-20793-1-git-send-email-peter.maydell@linaro.org>
References: <1399641773-20793-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/audio/intel-hda: Avoid shift into
	sign bit
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
X-List-Received-Date: Fri, 09 May 2014 14:08:53 -0000

On Fr, 2014-05-09 at 14:22 +0100, Peter Maydell wrote:
> Add a U suffix to avoid shifting into the sign bit (which is
> undefined behaviour in C).

Added to audio patch queue.

thanks,
  Gerd



