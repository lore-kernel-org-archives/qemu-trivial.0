Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rQSLF-0007OP-U6
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jan 2024 08:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQSL9-0007DW-1L
 for qemu-trivial@nongnu.org; Thu, 18 Jan 2024 08:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQSL7-00052m-E5
 for qemu-trivial@nongnu.org; Thu, 18 Jan 2024 08:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705584108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5D1670npY2V+R2n6CwrAED/nVrNrXgHnf+CzyLmDy6Q=;
 b=GEzuI7VfsNSR2dKAWtu/XVyPgB4+J/fRodcMGFabJTR4IKXMcHlYszTwwqqD2jkVQ2Rq3s
 BzsthRA5WLS4K6M5hET9PRcu5wr5uz++2AL4vwpA3DU73+weEEQYg+2sbZX4AgdvRfcobq
 t3n/Fg81IZ+sJomv/wp/OK6HXrAzNOk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185--y0RAicZNhyqgSGuFP8mVw-1; Thu, 18 Jan 2024 08:21:47 -0500
X-MC-Unique: -y0RAicZNhyqgSGuFP8mVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15349848C02;
 Thu, 18 Jan 2024 13:21:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8A592166B33;
 Thu, 18 Jan 2024 13:21:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B099321E66F1; Thu, 18 Jan 2024 14:21:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 2/4] qemu-options: Remove the deprecated -no-acpi option
In-Reply-To: <20240118103759.130748-3-thuth@redhat.com> (Thomas Huth's message
 of "Thu, 18 Jan 2024 11:37:57 +0100")
References: <20240118103759.130748-1-thuth@redhat.com>
 <20240118103759.130748-3-thuth@redhat.com>
Date: Thu, 18 Jan 2024 14:21:45 +0100
Message-ID: <87y1cmaiae.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
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
X-List-Received-Date: Thu, 18 Jan 2024 13:21:53 -0000

Thomas Huth <thuth@redhat.com> writes:

> It's been marked as deprecated since QEMU 8.0, so it should be fine
> to remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


