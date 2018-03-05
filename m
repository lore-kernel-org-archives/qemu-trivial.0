Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoI5-0004Gf-GM
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoI0-00040U-Bd
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHz-0007I1-7P
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:20 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:45838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHz-0007H6-0X; Mon, 05 Mar 2018 06:28:19 -0500
Received: by mail-wr0-x241.google.com with SMTP id p104so16838022wrc.12;
	Mon, 05 Mar 2018 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h3L4J8NwVJKTMCN72SId4QOb9WYbk4Lgkhvd7rMPnFU=;
	b=f3T5xlXc6jXkKtzo7w4aS4XffChYELQjmKUc+h34SLuVkzG0bW7I9vjBweRT++JiGy
	OWinQGCIGhiyuAJn+/+dhmQPsvGYL6HTS118Kcyj0kPrb7nAfuaTyhsZ6MLrCzV+HHkU
	DKhFZ60wUdTuoER5+Jct/BL0/aN7ThI0wtqbuBgpgSw5+GT4HuReL33ury4D/+eTmNps
	pn6xgxAWkUCAo3AwG+jE9bP43PiyIiSiMJJRw5yKweNTtZQhp9Z0OD7S957Dwmt8Pe+A
	OoiszX0wiD7dLGpztWVbIwmdVsEqTaDJWv73WS3QeYkVfyj59Px+bVRne0f0PzagyAG1
	oVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=h3L4J8NwVJKTMCN72SId4QOb9WYbk4Lgkhvd7rMPnFU=;
	b=eBMaiT3MkGNo7S/PzaxtC+PcVy/d95xb3HK89pX/6hAJ9toU5XA7nhehz1ClvpOqaH
	m4ChtgIV0HVBUHcVSh6DTzc26ocAKOs4LOD2DcnnJWo/KygQ3eCp+6xSILfln000AwYS
	JsLo0B2t/fzTNh5EyD/vL6QcmgWqVRW4WtDSZn7kWMvPdagNvv+JR6S+UF48bArmeCcv
	yHkBiPq29wdc+3PkvHXZu0ilnP1MOlz1LO/uqDiQm7IhHFDu1V8oePSSxUB2T5jEDxea
	7ehVjrYTGUXlIHFkNQ9vFhlaQ5Ic44DBlPO5SNFQNfXy2TcH+hrcEgEMeY2AY2p6kz3P
	tgmA==
X-Gm-Message-State: APf1xPC+htv8yWZhzLoIJF1em6LmtREHy5Vy4M7zStJObhcCAOZ7feiU
	IoAQ6HTg+eCNS9D8q2JbNll6Mi3S7+4=
X-Google-Smtp-Source: AG47ELvvCxcJV+KJXkvDeWCku5Zwo6q5dRJwtalfusrGGcBuCrWUFBsj9pDfQbiMkFxFZn8B0cwKxA==
X-Received: by 10.223.133.182 with SMTP id 51mr11268568wrt.226.1520249297844; 
	Mon, 05 Mar 2018 03:28:17 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:17 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Date: Mon,  5 Mar 2018 08:27:31 -0300
Message-Id: <20180305112732.26471-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: [Qemu-trivial] [PATCH v2 29/30] tpm: use the BYTE-based definitions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 11:28:21 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/acpi/tpm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
index 46ac4dc581..c01e3441f5 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -176,7 +176,7 @@ REG32(CRB_DATA_BUFFER, 0x80)
 #define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + A_CRB_CTRL_REQ)
 #define TPM_CRB_R_MAX               R_CRB_DATA_BUFFER
 
-#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * 1024)
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * K_BYTE)
 
 #define TPM_TCPA_ACPI_CLASS_CLIENT  0
 #define TPM_TCPA_ACPI_CLASS_SERVER  1
-- 
2.16.2


