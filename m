Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qHNNX-0005Rs-Eo
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jul 2023 07:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qHNNW-0005RT-5W
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 07:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qHNNN-00077m-A5
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 07:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688643738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JUduR/Bwi1v0roLeHwv+HCpk0DV295GfQxEuB4DbDNQ=;
 b=U+9L/kqcBM3TD8yXkv4m437G62lcsTFfl9aaBvrW1CmPDadsCBPOtHzEuqqIvVbslLGSvF
 /59JY+r9gxgmnTP0o+65yJxBO3d7D/4h7VHgqQbI/oMiHyonPZz3PTfsVx+HOOAX53+y0F
 DGAC8kK5Y9NqBrwkjw5hLEoBTRXL/Gw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-p0RVQvtdP8WZlAu3UK-ROw-1; Thu, 06 Jul 2023 07:42:17 -0400
X-MC-Unique: p0RVQvtdP8WZlAu3UK-ROw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbaade0c71so3490445e9.2
 for <qemu-trivial@nongnu.org>; Thu, 06 Jul 2023 04:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688643736; x=1691235736;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUduR/Bwi1v0roLeHwv+HCpk0DV295GfQxEuB4DbDNQ=;
 b=ZKP/fMKOb3Gdcxg0yfClDFoS7G/xYPHQaRn8bZFbnPlvY1QH8OneU/yJ54KU7HVgCq
 NoBa0dToa6DfyyK9jt4OnIZGUaylfULjdulploudV+6E6XTmeb1aJjtvKdlLMr+X9TVx
 J9oE7vWidVi5NxP4KIwE6wWR0X3o7ex+9iQF2fgAq6R6/wUzjH+RH7p10CY9kksmbGnh
 dnWlP3c8kJIcr/OVACdAJQoetz9fFvy0NndJFribI19NCcBkTWoeO327JbtpWSIzlIaD
 NAAu2xhHX3NAgJ6nHKvGR1e9u+HTSn3KuP4bZMtEZW17tyC94Hfid2KFGWgGCS7vVZj0
 UFOw==
X-Gm-Message-State: ABy/qLZkaviegvC2jJ1WMIe6MjvqRqKZ+Z3eAcyYe3BwJN/2vPI8784Q
 iZDKUnttbsP1W+4elMnZdGacXAd22IaTznCCpKeMH+ywov2YePtftpfIBFpPpAqIVyS8ftsaGlC
 jY05FwqZ5okmQnGO0Cw==
X-Received: by 2002:a1c:7204:0:b0:3fa:9767:c816 with SMTP id
 n4-20020a1c7204000000b003fa9767c816mr1047873wmc.39.1688643735927; 
 Thu, 06 Jul 2023 04:42:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+gQExkVZ4+CA7TY1ttMMPhnJGDCSd+dTPylauck7BugEXiRpbGJCJeLQYKC/SAuOOnljmsw==
X-Received: by 2002:a1c:7204:0:b0:3fa:9767:c816 with SMTP id
 n4-20020a1c7204000000b003fa9767c816mr1047860wmc.39.1688643735643; 
 Thu, 06 Jul 2023 04:42:15 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b003fbd1c8d230sm4908129wmi.20.2023.07.06.04.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 04:42:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 1/2] migration: factor out "resume_requested" in
 qmp_migrate()
In-Reply-To: <20230706102937.82490-2-lersek@redhat.com> (Laszlo Ersek's
 message of "Thu, 6 Jul 2023 12:29:36 +0200")
References: <20230706102937.82490-1-lersek@redhat.com>
 <20230706102937.82490-2-lersek@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 06 Jul 2023 13:42:14 +0200
Message-ID: <871qhlb71l.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jul 2023 11:42:30 -0000

Laszlo Ersek <lersek@redhat.com> wrote:
> It cuts back on those awkward, duplicated !(has_resume && resume)
> expressions.
>
> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
> Cc: Leonardo Bras <leobras@redhat.com> (reviewer:Migration)
> Cc: Peter Xu <peterx@redhat.com> (reviewer:Migration)
> Cc: qemu-trivial@nongnu.org
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2018404
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks.

queued.


