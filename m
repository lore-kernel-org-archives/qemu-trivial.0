Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSu7-0000tQ-0z
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 07:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jYSu6-0000sc-2d
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 07:16:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53624
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jYSu5-0001Ok-Bd
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 07:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589282212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLWC9tiJgqJ4f9t7I2NkuKApfx65ObWmgWxE+kr2YFg=;
 b=LDvsAdyD9dKqPd3LW2kywMxcHmd6dRWGNYSvfyaHNCI7y6YyIRZFaElXGUG3epWzO7zykO
 gxWPSeoXfadidPJhBfIstYKPN/4XTxVqmqPi6WFaXPP7WvNCTU3x9XZ/V91r7hR9KbWiTP
 WHpFQbtZZG20vbO4WllTsRrFm6fhubQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-C4f_ajaDNqa9YGj5dZxytQ-1; Tue, 12 May 2020 07:16:50 -0400
X-MC-Unique: C4f_ajaDNqa9YGj5dZxytQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA8C800687;
 Tue, 12 May 2020 11:16:49 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-74.ams2.redhat.com [10.36.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 260211036B4B;
 Tue, 12 May 2020 11:16:42 +0000 (UTC)
Date: Tue, 12 May 2020 13:16:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 0/6] scripts: More Python fixes
Message-ID: <20200512111641.GJ5951@linux.fritz.box>
References: <20200512103238.7078-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512103238.7078-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2020 11:16:54 -0000

Am 12.05.2020 um 12:32 hat Philippe Mathieu-Daudé geschrieben:
> Trivial Python3 fixes, again...
> 
> Since v3:
> - Fixed missing scripts/qemugdb/timers.py (kwolf)
> - Cover more scripts
> - Check for __main__ in few scripts

I'm not sure if the __main__ check actually provides anything useful in
source files of standalone tools that aren't supposed to be imported
from somewhere else. But of course, it's not wrong either.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


