Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNALL-000416-13
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2020 03:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNALJ-0003yb-O3
 for qemu-trivial@nongnu.org; Tue, 29 Sep 2020 03:46:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNALF-0005Vg-1e
 for qemu-trivial@nongnu.org; Tue, 29 Sep 2020 03:46:33 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601365588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0Qyela3obkqdVoSXZB5QwIQuNEHecxRZxrJfFaj+mc=;
 b=XwXQhEkpI27ncQrKo0c/ErIU4topLgksG2wKrr/MfQhtnGU9f41rwxZ+3h6fr1VcDBzuXW
 qndBQMnr6xioFj/VPUfRJEnnjITiz/WZTU04v5meqdYYG76oBalkx29hc9AjSitohoDISK
 AQ9gl9J7C4CumDjoKaG3p2yYyBn3GU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-ho1ZmhdmONibNPX7Z363Zw-1; Tue, 29 Sep 2020 03:46:24 -0400
X-MC-Unique: ho1ZmhdmONibNPX7Z363Zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A25A1868421;
 Tue, 29 Sep 2020 07:46:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA01A19D6C;
 Tue, 29 Sep 2020 07:46:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3E0A8113864A; Tue, 29 Sep 2020 09:46:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: duboisj@gmail.com,  qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,
 Josh DuBois <josh@joshdubois.com>
Subject: Re: [PATCH] trace/simple: Enable tracing on startup only if the
 user specifies a trace option
References: <20200816174610.20253-1-josh@joshdubois.com>
 <20200911100805.GB81586@stefanha-x1.localdomain>
Date: Tue, 29 Sep 2020 09:46:21 +0200
In-Reply-To: <20200911100805.GB81586@stefanha-x1.localdomain> (Stefan
 Hajnoczi's message of "Fri, 11 Sep 2020 11:08:05 +0100")
Message-ID: <87lfgt3u0i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
X-List-Received-Date: Tue, 29 Sep 2020 07:46:34 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Sun, Aug 16, 2020 at 12:46:10PM -0500, duboisj@gmail.com wrote:
>> From: Josh DuBois <josh@joshdubois.com>
>> 
>> Tracing can be enabled at the command line or via the
>> monitor. Command-line trace options are recorded during
>> trace_opt_parse(), but tracing is not enabled until the various
>> front-ends later call trace_init_file(). If the user passes a trace
>> option on the command-line, remember that and enable tracing during
>> trace_init_file().  Otherwise, trace_init_file() should record the
>> trace file specified by the frontend and avoid enabling traces
>> until the user requests them via the monitor.
>> 
>> This fixes 1b7157be3a8c4300fc8044d40f4b2e64a152a1b4 and also
>> db25d56c014aa1a96319c663e0a60346a223b31e, by allowing the user
>> to enable traces on the command line and also avoiding
>> unwanted trace-<pid> files when the user has not asked for them.
>> 
>> Fixes: 1b7157be3a8c4300fc8044d40f4b2e64a152a1b4
>> Signed-off-by: Josh DuBois <josh@joshdubois.com>
>> ---
>>  trace/control.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> Thanks, applied to my tracing-next tree:
> https://github.com/stefanha/qemu/commits/tracing-next
>
> Stefan

Pull request?


