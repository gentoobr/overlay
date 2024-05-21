# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_GENPATCHES_VER="168"
CLEAR_VER="${PV/_p/-}"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Clear Linux sources including Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://github.com/clearlinux-pkgs/linux-lts2021"
CLEAR_URI="https://github.com/clearlinux-pkgs/linux-lts2021/archive/refs/tags/${CLEAR_VER}.tar.gz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CLEAR_URI}"
KEYWORDS="amd64 x86"
IUSE="experimental"

CLEAR_PATCHDIR="${WORKDIR}/linux-lts2021-${CLEAR_VER}"

UNIPATCH_STRICTORDER=1
UNIPATCH_LIST="
	"${CLEAR_PATCHDIR}"/0101-i8042-decrease-debug-message-level-to-info.patch
	"${CLEAR_PATCHDIR}"/0102-increase-the-ext4-default-commit-age.patch
	"${CLEAR_PATCHDIR}"/0103-silence-rapl.patch
	"${CLEAR_PATCHDIR}"/0104-pci-pme-wakeups.patch
	"${CLEAR_PATCHDIR}"/0105-ksm-wakeups.patch
	"${CLEAR_PATCHDIR}"/0106-intel_idle-tweak-cpuidle-cstates.patch
	"${CLEAR_PATCHDIR}"/0107-bootstats-add-printk-s-to-measure-boot-time-in-more-.patch
	"${CLEAR_PATCHDIR}"/0108-smpboot-reuse-timer-calibration.patch
	"${CLEAR_PATCHDIR}"/0109-initialize-ata-before-graphics.patch
	"${CLEAR_PATCHDIR}"/0110-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch
	"${CLEAR_PATCHDIR}"/0111-init-wait-for-partition-and-retry-scan.patch
	"${CLEAR_PATCHDIR}"/0112-print-fsync-count-for-bootchart.patch
	"${CLEAR_PATCHDIR}"/0113-add-boot-option-to-allow-unsigned-modules.patch
	"${CLEAR_PATCHDIR}"/0114-enable-stateless-firmware-loading.patch
	"${CLEAR_PATCHDIR}"/0115-migrate-some-systemd-defaults-to-the-kernel-defaults.patch
	"${CLEAR_PATCHDIR}"/0116-xattr-allow-setting-user.-attributes-on-symlinks-by-.patch
	"${CLEAR_PATCHDIR}"/0117-add-scheduler-turbo3-patch.patch
	"${CLEAR_PATCHDIR}"/0118-use-lfence-instead-of-rep-and-nop.patch
	"${CLEAR_PATCHDIR}"/0119-do-accept-in-LIFO-order-for-cache-efficiency.patch
	"${CLEAR_PATCHDIR}"/0120-locking-rwsem-spin-faster.patch
	"${CLEAR_PATCHDIR}"/0121-ata-libahci-ignore-staggered-spin-up.patch
	"${CLEAR_PATCHDIR}"/0122-print-CPU-that-faults.patch
	"${CLEAR_PATCHDIR}"/0123-x86-microcode-Add-an-option-to-reload-microcode-even.patch
	"${CLEAR_PATCHDIR}"/0124-nvme-workaround.patch
	"${CLEAR_PATCHDIR}"/0125-don-t-report-an-error-if-PowerClamp-run-on-other-CPU.patch
"

src_unpack() {
	unpack "${CLEAR_VER}.tar.gz"
	kernel-2_src_unpack
	tail +24 "${CLEAR_PATCHDIR}/config" > "${S}/arch/x86/configs/clear.config"
	rm -rf "${CLEAR_PATCHDIR}"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "The default Clear Linux configuration is installed as a fragment."
	einfo "If you want to use it, run \"make defconfig clear.config\"."
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
