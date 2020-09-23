Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kL6XK-0002TT-K4
	for mharc-qemu-trivial@gnu.org; Wed, 23 Sep 2020 11:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kL6XB-0002Nv-Nu
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 11:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kL6X9-0004pF-JR
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 11:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600874294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZtuYQxEXQHmmLPY/YNLronE3WuZi8xHxajv91xkyzc=;
 b=h7eSEj+I+/jMmsi0tnUhix5Hx1NBX1WiSbi1gCmOmA/spkBq8PPxIcOifp5SVQZZkBEhK3
 4lqDSVmYaihbkpV76LpTr8wCBfPC9LZ+rpqHF7WJFpODymYHPqCcM+KipQGx07JRZc2McB
 IXHpHG6uZhPIk+9Ya4peOepBtiNZNXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-C6HmXw5DN0-XgAJj6wN53Q-1; Wed, 23 Sep 2020 11:18:11 -0400
X-MC-Unique: C6HmXw5DN0-XgAJj6wN53Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDFCA10BBED1;
 Wed, 23 Sep 2020 15:18:09 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-239.ams2.redhat.com [10.36.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 581219CBA;
 Wed, 23 Sep 2020 15:18:08 +0000 (UTC)
Date: Wed, 23 Sep 2020 17:18:06 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Liu Yuan <namei.unix@gmail.com>,
 sheepdog@lists.wpkg.org, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] block/sheepdog: Replace magic val by
 NANOSECONDS_PER_SECOND definition
Message-ID: <20200923151806.GD6912@linux.fritz.box>
References: <20200921110145.520944-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200921110145.520944-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 23 Sep 2020 15:18:18 -0000

Am 21.09.2020 um 13:01 hat Philippe Mathieu-Daudé geschrieben:
> Use self-explicit NANOSECONDS_PER_SECOND definition instead
> of magic value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks, applied to the block branch.

Kevin


