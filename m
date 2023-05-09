Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pwNOd-000124-Ge
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2023 09:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwNOS-0000ke-RY
 for qemu-trivial@nongnu.org; Tue, 09 May 2023 09:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwNOQ-0000pe-Bv
 for qemu-trivial@nongnu.org; Tue, 09 May 2023 09:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683638914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gv3r/rQu6zIyQYAjmW+Z8oX026ZIgkLXGTRZrHibG1U=;
 b=JHZFk1IPxMYLIlSJQ+VrEUj46kTvUMrLAV+dYBO1dR/4AmTgAYoeeX409dMzQ+1UvPL7D/
 lJA0TJiFDVC5umB386xSj6Hsy7le5VlWtrSCC7E2BjE8iZtE12zugHAmHHuVAD81jcQYJd
 o0BtH8MVUo3PENJW/7j4ivpiyt3MBQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-Wn7bNpFIOfWRnnrhRICxQA-1; Tue, 09 May 2023 09:28:31 -0400
X-MC-Unique: Wn7bNpFIOfWRnnrhRICxQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED8248995AD;
 Tue,  9 May 2023 13:28:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9FC82166B26;
 Tue,  9 May 2023 13:28:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9303C21E6924; Tue,  9 May 2023 15:28:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs: Remove unused weirdly-named cross-reference targets
References: <20230421163642.1151904-1-peter.maydell@linaro.org>
Date: Tue, 09 May 2023 15:28:29 +0200
In-Reply-To: <20230421163642.1151904-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 21 Apr 2023 17:36:42 +0100")
Message-ID: <878rdxeirm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 09 May 2023 13:28:48 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> In the doc sources, we have a few cross-reference targets with odd
> names "pcsys_005fxyz".  These are the legacy of the semi-automated
> conversion of the old info docs to rST (the '005f' is because ASCII
> 0x5f is '_' and the old info link names had underscores in them).
>
> Remove the targets which nothing links to, and rename the two targets
> which are used to something a bit more descriptive.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


