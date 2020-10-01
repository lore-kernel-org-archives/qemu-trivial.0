Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO0eI-0007Rf-Eb
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 11:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kO0eD-0007PC-0r
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kO0eA-00037L-60
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601566649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33aJxdh6HAlTA8g7S4dce5PX6RL5opkg1G3xSLL3HmM=;
 b=V7FQd59ELP+613bDdTNUzsps9ynCjutJBO4bdDUITRdGUeCDIVAbZx5l7Bw3OCiUAzRh9q
 xS13ek/8y/fPStvlXBO7FTM5VpmGnrjPyMcnGPA7M/oglPZtj/X8zfUiezLMNzeQXXjh63
 GtliK6LDALH3qG8rg66EeiBzsrw3NF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-RZfOEQmQO0y-PQ5yA3Hk5w-1; Thu, 01 Oct 2020 11:37:27 -0400
X-MC-Unique: RZfOEQmQO0y-PQ5yA3Hk5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65D62801AE2;
 Thu,  1 Oct 2020 15:37:26 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E84E25C1CF;
 Thu,  1 Oct 2020 15:37:25 +0000 (UTC)
Date: Thu, 1 Oct 2020 11:37:25 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 2/3] target/i386/cpu: Restrict some of feature-words
 uses to system-mode
Message-ID: <20201001153725.GD3717385@habkost.net>
References: <20201001144152.1555659-1-philmd@redhat.com>
 <20201001144152.1555659-3-philmd@redhat.com>
 <933089b7-a088-d142-bf0c-55cae3e9bd70@redhat.com>
 <53758e35-f596-8e17-12cf-58b1a81f98e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <53758e35-f596-8e17-12cf-58b1a81f98e3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 01 Oct 2020 15:37:34 -0000

On Thu, Oct 01, 2020 at 05:27:32PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/1/20 5:14 PM, Paolo Bonzini wrote:
> > On 01/10/20 16:41, Philippe Mathieu-Daudé wrote:
> >> The feature-words properties are not used in user-mode emulation,
> >> restrict it to system-mode.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > 
> > This seems a bit pointless honestly.  It's going to be a few KBs of code
> > at most.  I would end the work with the patches that have already been
> > queued.
> 
> I'll let Eduardo and you discuss that, as he suggested the #ifdef
> instead of the stub. The two options are on the list, whichever
> you guys prefer :)

Having neither the stub or the #ifdef is even better.  :)

I assumed the stub was necessary as a means for an end, but now I
don't understand why the stub was necessary in the first place.

-- 
Eduardo


